import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/utils/typedef.dart';

import '../../../themes/themes.dart';

class DataDiriController extends GetxController
    with StateMixin<AdministrasiModels?> {
  final AdministrasiProvider _administrasiProvider;
  DataDiriController(this._administrasiProvider);
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController ninController;
  late TextEditingController studyProgramController;
  late TextEditingController semesterController;
  late TextEditingController residenceAddressController;
  late TextEditingController ninAddressController;
  late TextEditingController birthPlaceController;
  Rx<TextEditingController> birthDateController = TextEditingController().obs;
  late TextEditingController phoneController;
  late TextEditingController nsnController;
  late TextEditingController universityOfOriginController;
  String? administrasiId;
  String? selectedGender;
  RxString gender = ''.obs;
  List<String> items = ['Laki - Laki', 'Perempuan'];
  RxBool isLoading = false.obs;

  void setGender(String? value) {
    switch (value) {
      case 'Laki - Laki':
        gender.value = '1';
        break;
      case 'Perempuan':
        gender.value = '2';
        break;
      default:
    }
    selectedGender = value!;
    update();
  }

  void datePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      birthDateController.value = TextEditingController(text: formattedDate);
    } else {}
  }

  Future getAdministrasi() async {
    try {
      AdministrasiModels? data = await _administrasiProvider.getAdministrasi();
      change(data, status: RxStatus.success());
      administrasiId = data?.administrationId;
      if (state?.biodata?.birthDate != null) {
        birthDateController.value =
            TextEditingController(text: state?.biodata!.birthDate.toString());
      }
      if (state?.biodata?.gender != null) {
        switch (state?.biodata?.gender) {
          case '1':
            selectedGender = 'Laki - Laki';
            gender.value = '1';
            break;
          case '2':
            selectedGender = 'Perempuan';
            gender.value = '2';
            break;
          default:
            null;
        }
      }
      if (state?.biodata?.fullName != null &&
          state?.biodata?.email != null &&
          state?.biodata?.nin != null &&
          state?.biodata?.studyProgram != null &&
          state?.biodata?.semester != null &&
          state?.biodata?.residenceAddress != null &&
          state?.biodata?.ninAddress != null &&
          state?.biodata?.birthPlace != null &&
          state?.biodata?.phone != null) {
        fullNameController =
            TextEditingController(text: state?.biodata!.fullName);
        emailController = TextEditingController(text: state?.biodata!.email);
        ninController = TextEditingController(text: state?.biodata!.nin);
        studyProgramController =
            TextEditingController(text: state?.biodata!.studyProgram);
        semesterController =
            TextEditingController(text: state?.biodata!.semester);
        residenceAddressController =
            TextEditingController(text: state?.biodata!.residenceAddress);
        ninAddressController =
            TextEditingController(text: state?.biodata!.ninAddress);
        birthPlaceController =
            TextEditingController(text: state?.biodata!.birthPlace);
        phoneController = TextEditingController(text: state?.biodata!.phone);
      }
      if (state?.biodata?.universityOfOrigin != null &&
          state?.biodata?.nsn != null) {
        universityOfOriginController =
            TextEditingController(text: state?.biodata?.universityOfOrigin);
        nsnController = TextEditingController(text: state?.biodata?.nsn);
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future putBiodata() async {
    JSON bodyBiodata = {
      "administration_id": administrasiId,
      "full_name": fullNameController.text,
      "email": emailController.text,
      "nin": ninController.text,
      "study_program": studyProgramController.text,
      "semester": semesterController.text,
      "nin_address": ninAddressController.text,
      "residence_address": residenceAddressController.text,
      "birth_place": birthPlaceController.text,
      "birth_date": birthDateController.value.text,
      "phone": phoneController.text,
      "gender": gender.value,
      "nsn": nsnController.text,
      "university_of_origin": universityOfOriginController.text
    };
    try {
      isLoading.value = true;
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Data Berhasil Disimpan",
                style: Themes.darkTheme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 13),
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              )
            ],
          ),
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 60),
          backgroundColor: const Color(0xFF3AAA35),
          duration: const Duration(seconds: 1),
          borderRadius: 8,
        ),
      );
      await _administrasiProvider.putBiodata(bodyBiodata);
      Get.toNamed('/data-keluarga');
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      Get.back();
      Get.defaultDialog(
          middleText: error.toString(), onConfirm: () => Get.back());
    }
  }

  @override
  void onInit() {
    getAdministrasi();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    ninController = TextEditingController();
    studyProgramController = TextEditingController();
    semesterController = TextEditingController();
    ninAddressController = TextEditingController();
    residenceAddressController = TextEditingController();
    birthPlaceController = TextEditingController();
    birthDateController.value = TextEditingController();
    phoneController = TextEditingController();
    nsnController = TextEditingController();
    universityOfOriginController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    ninController.dispose();
    studyProgramController.dispose();
    semesterController.dispose();
    ninAddressController.dispose();
    residenceAddressController.dispose();
    birthPlaceController.dispose();
    birthDateController.value.dispose();
    phoneController.dispose();
    nsnController.dispose();
    universityOfOriginController.dispose();
    super.onClose();
  }
}
