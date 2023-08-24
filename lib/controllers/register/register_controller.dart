import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/services/providers/auth/auth_provider.dart';
import 'package:kampus_gratis/widgets/dialog.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class RegisterController extends GetxController {
  final AuthProvider _authProvider;

  RegisterController(this._authProvider);

  UserCredential? userCredential;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController verifPasswordController;

  String? gender;
  String? selectedgender;
  RxBool passwordIsHidden = true.obs;
  RxBool confirmIsHidden = true.obs;
  RxBool isLoading = false.obs;
  RxBool errorInputGender = false.obs;
  var items = ['Laki - Laki', 'Perempuan'];
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
    errorInputGender.value = false;
    update();
  }

  var katakunci = ''.obs;
  var keterangan = 'masukkan minimal 8 karater'.obs;
  RxDouble powerPass = 0.0.obs;

  RegExp numberRegExpress = RegExp('r".*[0-9].*"');
  RegExp letterRegExpress = RegExp(r".*[A-Za-z].*");

  void cekPowerPass(String value) {
    katakunci.value = value.trim();
    if (katakunci.value.isEmpty) {
      powerPass.value = 0.0;
      // keterangan.value = "masukkan minimal 8 karater";
    } else if (katakunci.value.length < 6) {
      powerPass.value = 1 / 4;
      keterangan.value = "password terlalu pendek";
    } else if (katakunci.value.length < 8) {
      powerPass.value = 2 / 4;
      keterangan.value = "password kurang kuat";
    } else {
      if (!letterRegExpress.hasMatch(katakunci.value) ||
          !numberRegExpress.hasMatch(katakunci.value)) {
        powerPass.value = 3 / 4;
        keterangan.value = "password kuat";
      } else {
        powerPass.value = 1;
        keterangan.value = "password sangat kuat";
      }
    }
  }

  void register() async {
    try {
      isLoading.value = true;
      // assign request
      final registerBody = {
        'email': emailController.text,
        'password': passwordController.text,
        'hp': phoneController.text,
        'full_name': nameController.text,
        'gender': selectedgender,
      };

      await _authProvider.register(registerBody);
      isLoading.value = false;
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => KGDialog(
          filePath: 'assets/icons/checklist.svg',
          title: 'Berhasil mendaftar',
          middleText:
              'Silakan klik link verifikasi yang dikirimkan ke email anda.',
          textConfirm: 'Masuk',
          onConfirm: () {
            nameController.clear();
            emailController.clear();
            phoneController.clear();
            passwordController.clear();
            verifPasswordController.clear();
            selectedgender = null;
            errorInputGender.value = false;
            Get.offNamed('/login');
          },
          actionsDirection: ActionsDirection.horizontal,
        ),
      );
    } catch (e) {
      isLoading.value = false;
      if (e.toString().contains('This email already used by another account')) {
        return showDialog(
          context: Get.context!,
          builder: (context) => KGDialog(
            filePath: 'assets/icons/exclamation_sign.svg',
            title: 'Email telah terdaftar',
            middleText:
                'Silahkan periksa kembali email anda untuk melanjutkan pendaftaran.',
            textConfirm: 'Selesai',
            onConfirm: () => Get.back(),
            actionsDirection: ActionsDirection.horizontal,
          ),
        );
      }
      KGSnackBar.showKGSnackBar(Get.context!, '$e',
          backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    verifPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    verifPasswordController.dispose();
    selectedgender = null;
    errorInputGender.value = false;
  }
}
