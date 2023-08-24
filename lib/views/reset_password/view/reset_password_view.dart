import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/reset_password/reset_password_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_textfield.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Stack(children: [
      KGScaffold(
        backgroundColor: ColorConstants.mainBlue,
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            children: <Widget>[
              const KGAppBar(backButton: false, title: '', withIconKG: true),
              const Text('Lupa Sandi',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFBFE))),
              const Text(
                'Masukkan email yang tertaut',
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
              const SizedBox(
                height: 4.0,
              ),
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
                              if (formKey.currentState!.validate()) {
                                controller.resetPassword();
                              }
                            },
                      child: const Text(
                        'Kirim',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff383838)),
                      ),
                    )),
              ),
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
