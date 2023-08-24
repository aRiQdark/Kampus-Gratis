import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/utils/typedef.dart';

import '../../../themes/themes.dart';

class DataKeluargaController extends GetxController
    with StateMixin<AdministrasiModels?> {
  DataKeluargaController(this._administrasiProvider);
  final AdministrasiProvider _administrasiProvider;
  late TextEditingController fatherNameController;
  late TextEditingController fatherOccupationController;
  late TextEditingController motherNameController;
  late TextEditingController motherOccupationController;
  late TextEditingController occupationController;
  String? administrasiId;
  String? fatherIncome;
  String? motherIncome;
  String? income;
  String? livingPartner;
  String? financier;
  RxBool isLoading = false.obs;
  List<String> fatherIncomeItems = [
    'Rp. 0 - 1.000.000',
    'Rp. 1.000.000 - 1.500.000',
    'Rp. 1.500.000 - 2.000.000',
    'Rp. 2.000.000 - 3.000.000',
    'Rp. 3.000.000 - 4.000.000',
    'Rp. 4.000.000 - 5.000.000',
    'Rp. 5.000.000 - 6.000.000',
    'Rp. 6.000.000 - 7.000.000',
    'Rp. > 7.000.000'
  ];
  List<String> motherIncomeItems = [
    'Rp. 0 - 1.000.000',
    'Rp. 1.000.000 - 1.500.000',
    'Rp. 1.500.000 - 2.000.000',
    'Rp. 2.000.000 - 3.000.000',
    'Rp. 3.000.000 - 4.000.000',
    'Rp. 4.000.000 - 5.000.000',
    'Rp. 5.000.000 - 6.000.000',
    'Rp. 6.000.000 - 7.000.000',
    'Rp. > 7.000.000'
  ];
  List<String> incomeItems = [
    'Rp. 0 - 1.000.000',
    'Rp. 1.000.000 - 1.500.000',
    'Rp. 1.500.000 - 2.000.000',
    'Rp. 2.000.000 - 3.000.000',
    'Rp. 3.000.000 - 4.000.000',
    'Rp. 4.000.000 - 5.000.000',
    'Rp. 5.000.000 - 6.000.000',
    'Rp. 6.000.000 - 7.000.000',
    'Rp. > 7.000.000'
  ];
  List<String> livingPartnerItems = [
    'Sendiri',
    'Orang Tua',
    'Wali',
  ];
  void setDropdown(String newValue, int kategori) {
    switch (kategori) {
      case 0:
        {
          fatherIncome = newValue;
          break;
        }
      case 1:
        {
          motherIncome = newValue;
          break;
        }
      case 2:
        {
          income = newValue;
          break;
        }
      case 3:
        {
          livingPartner = newValue;
          break;
        }
      case 4:
        {
          financier = newValue;
          break;
        }
      default:
        null;
    }
    update();
  }

  Future getAdministrasi() async {
    try {
      AdministrasiModels? data = await _administrasiProvider.getAdministrasi();
      change(data, status: RxStatus.success());
      administrasiId = data?.administrationId;
      if (state?.familial?.fatherName != null &&
          state?.familial?.fatherOccupation != null &&
          state?.familial?.fatherIncome != null &&
          state?.familial?.motherName != null &&
          state?.familial?.motherOccupation != null &&
          state?.familial?.motherIncome != null &&
          state?.familial?.occupation != null &&
          state?.familial?.income != null &&
          state?.familial?.livingPartner != null &&
          state?.familial?.financier != null) {
        fatherNameController =
            TextEditingController(text: state?.familial!.fatherName);
        fatherOccupationController =
            TextEditingController(text: state?.familial!.fatherOccupation);
        fatherIncome = state?.familial!.fatherIncome;
        motherNameController =
            TextEditingController(text: state?.familial!.motherName);
        motherOccupationController =
            TextEditingController(text: state?.familial!.motherOccupation);
        motherIncome = state?.familial!.motherIncome;
        occupationController =
            TextEditingController(text: state?.familial!.occupation);
        income = state?.familial!.income;
        livingPartner = state?.familial!.livingPartner;
        financier = state?.familial!.financier;
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future putFamilial() async {
    JSON bodyFamilial = {
      "father_name": fatherNameController.text,
      "father_occupation": fatherOccupationController.text,
      "father_income": fatherIncome,
      "mother_name": motherNameController.text,
      "mother_occupation": motherOccupationController.text,
      "mother_income": motherIncome,
      "occupation": occupationController.text,
      "income": income,
      "living_partner": livingPartner,
      "financier": financier
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
      await _administrasiProvider.putFamilial(bodyFamilial);
      Get.toNamed('/berkas');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Data Tidak Lengkap !!!', 'Lengkapi Data Terlebih Dahulu');
      throw Exception(e.toString());
    }
  }

  @override
  void onInit() {
    getAdministrasi();
    fatherNameController = TextEditingController();
    fatherOccupationController = TextEditingController();
    motherNameController = TextEditingController();
    motherOccupationController = TextEditingController();
    occupationController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fatherNameController.dispose();
    fatherOccupationController.dispose();
    motherNameController.dispose();
    motherOccupationController.dispose();
    occupationController.dispose();
    super.onClose();
  }
}
