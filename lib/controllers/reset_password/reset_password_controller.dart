import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/widgets/dialog.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> resetPassword() async {
    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: emailController.text);

      isLoading.value = false;
      showDialog(
          context: Get.context!,
          builder: (context) => KGDialog(
                filePath: 'assets/icons/checklist.svg',
                title: 'Link verifikasi terkirim',
                middleText:
                    'Silakan cek email anda untuk verifikasi perubahan kata sandi.',
                textConfirm: 'Selesai',
                onConfirm: () {
                  emailController.clear();
                  Get.offNamed('/login');
                },
                actionsDirection: ActionsDirection.horizontal,
              ));
    } catch (e) {
      isLoading.value = false;
      KGSnackBar.showKGSnackBar(Get.context!, '$e',
          backgroundColor: Colors.red);
    }
  }
}
