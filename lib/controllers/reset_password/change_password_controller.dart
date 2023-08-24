import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController {
  TextEditingController emailController = TextEditingController();

  late TextEditingController nameController;
  // late TextEditingController mailController;
  // late TextEditingController passwordController;
  late TextEditingController verifPasswordController;

  RxBool passwordIsHidden = true.obs;
  RxBool confirmIsHidden = true.obs;

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
}
