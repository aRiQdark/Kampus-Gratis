// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/services/providers/auth/auth_provider.dart';
import 'package:kampus_gratis/widgets/dialog.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class LoginController extends GetxController {
  final AuthProvider _authProvider;

  LoginController(this._authProvider);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GetStorage _storage = GetStorage();

  late TextEditingController emailController, passwordController;

  RxBool passwordIsHidden = true.obs;
  RxBool isLoading = false.obs;
  RxBool errorInputProgram = false.obs;

  UserCredential? userCredential;

  String? name,
      email,
      password,
      firebaseUid,
      accessToken,
      program,
      selectedprogram;

  var items = ['Pelatihan', 'Magang', 'Mahasiswa', 'Projek'];

  void setProgram(String? value) {
    switch (value) {
      case 'Pelatihan':
        selectedprogram = '1';
        break;
      case 'Magang':
        selectedprogram = '2';
        break;
      case 'Mahasiswa':
        selectedprogram = '3';
        break;
      case 'Projek':
        selectedprogram = '4';
        break;
      default:
        selectedprogram = '0';
    }
    program = value;
    errorInputProgram.value = false;
    update();
  }

  void signInWithEmailAndPassword() async {
    // firebase validation
    try {
      isLoading.value = true;
      userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = _auth.currentUser;

      // if no exception
      if (user != null) {
        List<String?> providerList = [];
        for (final providerProfile in user.providerData) {
          final provider = providerProfile.providerId;

          print('PROVIDER ID: $provider');
          providerList.add(provider);
          _storage.write('provider', providerList);
        }
        isLoading.value = false;
        // checking email verified
        if (user.emailVerified == true) {
          Get.offAllNamed('/home');
        } else {
          showDialog(
            context: Get.context!,
            builder: (context) => KGDialog(
              filePath: 'assets/icons/exclamation_sign.svg',
              imageHeight: 50.0,
              imageWidth: 50.0,
              title: 'Email belum terverifikasi',
              middleText:
                  'Email anda belum terverifikasi, silahkan verifikasi email terlebih dahulu.',
              textConfirm: 'Kirim email verifikasi',
              onConfirm: () async {
                Get.back();
                try {
                  isLoading.value = true;

                  await user.sendEmailVerification();
                  isLoading.value = false;

                  KGSnackBar.showKGSnackBar(
                    Get.context!,
                    'Email verifikasi berhasil terkirim',
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  );
                } catch (e) {
                  isLoading.value = false;
                  if (e
                      .toString()
                      .contains('firebase_auth/too-many-requests')) {
                    KGSnackBar.showKGSnackBar(
                      Get.context!,
                      "Terlalu banyak permintaan, coba lagi nanti",
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    );
                  }
                  KGSnackBar.showKGSnackBar(
                    Get.context!,
                    "$e",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              textCancel: 'Kembali',
              onCancel: () => Get.back(),
            ),
          );
        }
      } else {
        isLoading.value = false;
        return;
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      print('FIREBASE AUTH EXCEPTION : ${e.code}');
      if (e.code == 'user-not-found') {
        showDialog(
          context: Get.context!,
          builder: (context) => KGDialog(
            filePath: 'assets/icons/exclamation_sign.svg',
            actionsDirection: ActionsDirection.horizontal,
            imageHeight: 50.0,
            imageWidth: 50.0,
            title: 'Pengguna tidak ditemukan',
            middleText: 'Pastikan anda sudah mengisi email dengan benar',
            textCancel: 'Kembali',
            onCancel: () => Get.back(),
          ),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: Get.context!,
          builder: (context) => KGDialog(
            filePath: 'assets/icons/exclamation_sign.svg',
            actionsDirection: ActionsDirection.horizontal,
            imageHeight: 50.0,
            imageWidth: 50.0,
            title: 'Kata sandi salah',
            middleText: 'Pastikan anda sudah mengisi kata sandi dengan benar',
            textCancel: 'Kembali',
            onCancel: () => Get.back(),
          ),
        );

        print('Wrong password provided for that user.');
      } else if (e.code == 'unknown') {
        showDialog(
          context: Get.context!,
          builder: (context) => KGDialog(
            filePath: 'assets/icons/exclamation_sign.svg',
            actionsDirection: ActionsDirection.horizontal,
            imageHeight: 50.0,
            imageWidth: 50.0,
            title: 'Sepertinya ada masalah',
            middleText:
                'Untuk melanjutkan isi email dan password anda terlebih dahulu',
            textCancel: 'Kembali',
            onCancel: () => Get.back(),
          ),
        );
      }
    }
  }

  void signInWithGoogle() async {
    // firebase validation
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (firebaseError) {
      isLoading.value = false;

      KGSnackBar.showKGSnackBar(Get.context!, '$firebaseError',
          backgroundColor: Colors.red);
      _googleSignIn.signOut();
    } catch (error) {
      print('error: $error');
      isLoading.value = false;
      if (error
          .toString()
          .contains('At least one of ID token and access token is required')) {
        return;
      }
      KGSnackBar.showKGSnackBar(Get.context!, '$error',
          backgroundColor: Colors.red);
      _googleSignIn.signOut();
    }

    try {
      final user = _auth.currentUser;

      if (user != null) {
        List<String?> providerList = [];
        for (final providerProfile in user.providerData) {
          final provider = providerProfile.providerId;

          print('PROVIDER ID: $provider');
          providerList.add(provider);
          _storage.write('provider', providerList);
        }

        await _authProvider.loginGoogle();
        isLoading.value = false;
        Get.offAllNamed('/home');
      }
    } catch (e) {
      isLoading.value = false;
      KGSnackBar.showKGSnackBar(Get.context!, '$e',
          backgroundColor: Colors.red);
      _googleSignIn.signOut();
    }
  }

  void signOut() async {
    try {
      List<dynamic> provider = _storage.read('provider');
      print(provider);
      final isPassword = provider.contains('password');
      final isGoogle = provider.contains('google.com');

      if (isPassword && isGoogle || isGoogle) {
        await _googleSignIn.signOut();
        await _auth.signOut();
      }

      if (isPassword) {
        await _auth.signOut();
      }

      // route to login page
      if (_auth.currentUser == null) {
        // remove storage
        await _storage.remove('token');
        await _storage.remove('token-time');
        await _storage.remove('provider');
        await _storage.remove('student_id');
        await _storage.remove('role');

        // silabus dialog
        await _storage.remove('isShown');

        await Get.offAllNamed('/login');
      }
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  void removeProgram() {
    selectedprogram = null;
    errorInputProgram.value = false;
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    print('===== CONTROLLER LOGIN INIT =====');
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    removeProgram();
    super.onClose();
  }
}
