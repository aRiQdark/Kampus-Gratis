import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/register/register_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_textfield.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Stack(
      children: [
        KGScaffold(
          backgroundColor: ColorConstants.mainBlue,
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                const KGAppBar(
                  backButton: false,
                  title: '',
                  withIconKG: true,
                ),
                const Text('Daftar',
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFBFE))),
                const Text(
                  'Mohon isi kotak kosong dibawah ini dengan benar',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 36.0),
                const Text(
                  'Nama pengguna',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 4.0),
                PrimaryTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: controller.nameController,
                  hintText: 'Cth. Marsudi Cahyadi Pratama',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 4.0),
                PrimaryTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp("^[a-zA-Z0-9_.-]+@[a-zA-Z]+[.]+[a-z]")
                        .hasMatch(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  controller: controller.emailController,
                  hintText: 'Cth. email-kamu@mail.com',
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'No. telepon',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 4.0),
                PrimaryTextfield(
                  controller: controller.phoneController,
                  hintText: 'Cth. 081*********',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Kata Sandi ',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 4.0),
                Obx(
                  () => PrimaryTextfield(
                    onChanged: (value) {
                      controller.cekPowerPass(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (controller.powerPass.value < 3 / 4) {
                        return 'Your password is weak';
                      }
                      return null;
                    },
                    controller: controller.passwordController,
                    hintText: 'Masukkan kata sandi',
                    helperText:
                        'Minimal 8 karakter dan gunakan kombinasi huruf dan angka',
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
                const SizedBox(height: 8.0),
                Obx(
                  () => controller.powerPass.value != 0
                      ? Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          height: 10,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 25,
                                height: 10,
                                child: LinearProgressIndicator(
                                  value: controller.powerPass.value,
                                  color: Colors.transparent,
                                  backgroundColor: controller.powerPass.value <=
                                          1 / 4
                                      ? Colors.white
                                      : controller.powerPass.value == 2 / 4
                                          ? ColorConstants.yellow1
                                          : controller.powerPass.value == 3 / 4
                                              ? ColorConstants.green1
                                              : ColorConstants.cyan1,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 2);
                            },
                            itemCount: 5,
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 4.0),
                Obx(
                  () => controller.powerPass.value != 0
                      ? Text(
                          controller.keterangan.value,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Ulangi kata sandi ',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 4.0),
                Obx(
                  () => PrimaryTextfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm password';
                      } else if (controller.passwordController.text !=
                          controller.verifPasswordController.text) {
                        return 'Your confirm password is not same';
                      }
                      return null;
                    },
                    controller: controller.verifPasswordController,
                    hintText: 'Masukkan ulang kata sandi',
                    obscureText: controller.confirmIsHidden.value,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: controller.confirmIsHidden.value == true
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                      onPressed: () {
                        controller.confirmIsHidden.toggle();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Jenis kelamin',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFBFE)),
                ),
                const SizedBox(height: 4.0),
                GetBuilder<RegisterController>(
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
                                hint: const Text('Pilih jenis kelamin'),
                                value: controller.gender,
                                isExpanded: true,
                                items: controller.items
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.setGender(value);
                                },
                              )),
                            ),
                            Obx(
                              () => controller.errorInputGender.value
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 16.0),
                                      child: Text(
                                        'Please choose the gender',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        )),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: Obx(() => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.mainColorYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            padding:
                                const EdgeInsets.symmetric(vertical: 12.0)),
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                                if (controller.selectedgender == null) {
                                  controller.errorInputGender.value = true;
                                }
                                if (formKey.currentState!.validate() &&
                                    controller.selectedgender != null) {
                                  controller.errorInputGender.value = false;

                                  controller.register();
                                }
                              },
                        child: const Text(
                          'Daftar',
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
                      'Sudah punya akun?',
                      style: TextStyle(
                          color: Color(0xffFFFBFE),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    TextButton(
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                            color: Color(0xff15C8A8),
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0),
                      ),
                      onPressed: () => Get.offNamed('/login'),
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
      ],
    );
  }
}
