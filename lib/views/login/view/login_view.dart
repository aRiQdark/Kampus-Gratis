import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/login/login_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_textfield.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Stack(children: <Widget>[
      KGScaffold(
        backgroundColor: ColorConstants.mainBlue,
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            children: <Widget>[
              const KGAppBar(backButton: false, title: '', withIconKG: true),
              const Text('Login',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFBFE))),
              const Text(
                'Masuk untuk melanjutkan',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFBFE)),
              ),
              const SizedBox(height: 36.0),
              const Text(
                'Email',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFBFE)),
              ),
              const SizedBox(height: 4.0),
              PrimaryTextfield(
                controller: controller.emailController,
                hintText: 'Cth. email-kamu@mail.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp("^[a-zA-Z0-9_.-]+@[a-zA-Z]+[.]+[a-z]")
                      .hasMatch(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Kata sandi',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFBFE)),
              ),
              const SizedBox(height: 4.0),
              Obx(
                () => PrimaryTextfield(
                  hintText: 'Masukkan kata sandi',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  controller: controller.passwordController,
                  obscureText: controller.passwordIsHidden.value,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: controller.passwordIsHidden.value == true
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                    onPressed: () {
                      controller.passwordIsHidden.toggle();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Masuk sebagai',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFBFE)),
              ),
              const SizedBox(
                height: 4.0,
              ),
              GetBuilder<LoginController>(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputDecorator(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          fillColor: const Color(0xffFFFBFE),
                          filled: true),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(24.0),
                        isDense: true,
                        hint: const Text('Pilihan masuk'),
                        value: controller.program,
                        isExpanded: true,
                        items: controller.items
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.setProgram(value);
                        },
                      )),
                    ),
                    Obx(
                      () => controller.errorInputProgram.value
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 16.0),
                              child: Text(
                                'Please choose the program',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Center(
                child: TextButton(
                  child: const Text(
                    'Lupa kata sandi?',
                    style: TextStyle(
                        color: Color(0xff15C8A8),
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0),
                  ),
                  onPressed: () {
                    Get.toNamed('/reset-password');
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Obx(() => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.mainColorYellow,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          padding: const EdgeInsets.symmetric(vertical: 12.0)),
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              if (formKey.currentState!.validate() &&
                                  controller.selectedprogram != null) {
                                if (controller.selectedprogram != '3') {
                                  var index =
                                      int.parse(controller.selectedprogram!) -
                                          1;
                                  KGSnackBar.showKGSnackBar(Get.context!,
                                      'Program ${controller.items[index].toLowerCase()} belum tersedia',
                                      backgroundColor: Colors.red);
                                  return;
                                }
                                return controller.signInWithEmailAndPassword();
                              }
                              if (controller.selectedprogram == null) {
                                controller.errorInputProgram.value = true;
                                KGSnackBar.showKGSnackBar(
                                    context, 'Program wajib dipilih',
                                    backgroundColor: Colors.amber,
                                    textColor: Colors.black);
                                return;
                              }
                            },
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff383838)),
                      ),
                    )),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: Obx(() => ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          padding: const EdgeInsets.symmetric(vertical: 12.0)),
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              if (controller.selectedprogram == null) {
                                KGSnackBar.showKGSnackBar(
                                    context, 'Program wajib dipilih',
                                    backgroundColor: Colors.amber,
                                    textColor: Colors.black);
                                controller.errorInputProgram.value = true;
                                return;
                              }

                              if (controller.selectedprogram != '3') {
                                var index =
                                    int.parse(controller.selectedprogram!) - 1;
                                KGSnackBar.showKGSnackBar(context,
                                    'Program ${controller.items[index].toLowerCase()} belum tersedia',
                                    backgroundColor: Colors.red);
                                return;
                              }

                              controller.signInWithGoogle();
                            },
                      icon: Image.asset('assets/icons/google.png',
                          height: 16.0, width: 16.0),
                      label: const Text(
                        'Lanjutkan dengan Google',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff383838)),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(
                        color: Color(0xffFFFBFE),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                  TextButton(
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                          color: Color(0xff15C8A8),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0),
                    ),
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Obx(
        () => controller.isLoading.value
            ? Container(
                height: Get.height,
                width: Get.width,
                color: Colors.black38,
                child: const Center(child: CircularProgressIndicator()),
              )
            : const SizedBox(),
      )
    ]);
  }
}
