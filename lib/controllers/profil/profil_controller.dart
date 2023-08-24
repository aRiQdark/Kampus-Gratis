import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/controllers/app_controller.dart';
import 'package:kampus_gratis/models/profile_model.dart';
import 'package:kampus_gratis/services/providers/profile_provider.dart';

class ProfilController extends GetxController with StateMixin<KGUserModel?> {
  final ProfileProvider _profileProvider;

  ProfilController(this._profileProvider);
  late TextEditingController nameController;
  AppController appController = Get.find<AppController>();
  RxBool isNoConnection = false.obs;
  RxBool isLoading = false.obs;
  String? userRole;
  String? gender;
  String? selectedgender;
  var items = ['Laki - Laki', 'Perempuan'];

  Future<void> fetchUserInfo() async {
    try {
      isLoading.value = true;
      KGUserModel? user = await _profileProvider.getUser();
      final localStorage = GetStorage();
      localStorage.write('role', user!.role);
      localStorage.write('student_id', user.studentId);
      isNoConnection.value = false;
      change(user, status: RxStatus.success());
      userRole = user.role;
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;

      if (error.toString().contains('No Connection')) {
        // Get.closeAllSnackbars();
        // Get.showSnackbar(const GetSnackBar(
        //   title: 'Error',
        //   message: 'Koneksi tidak tersedia',
        //   backgroundColor: Colors.red,
        //   animationDuration: Duration(milliseconds: 500),
        //   duration: Duration(seconds: 3),
        // ));
        isNoConnection.value = true;
      }
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  updateProfile() async {
    try {
      isLoading.value = true;

      var body = {"full_name": nameController.text, "gender": selectedgender};
      var response = await _profileProvider.updateUser(body);
      change(response, status: RxStatus.success());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void setGender(String? value) {
    switch (value) {
      case 'Laki - Laki':
        selectedgender = '1';
        break;
      case 'Perempuan':
        selectedgender = '2';
        break;
      default:
        selectedgender = '0';
    }
    gender = value;
    update();
  }

  @override
  void onInit() async {
    nameController = TextEditingController();
    await fetchUserInfo();
    super.onInit();
  }
}
