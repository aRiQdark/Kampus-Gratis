import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/reset_password/change_password_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import 'package:kampus_gratis/widgets/primary_textfield.dart';

import '../../../themes/themes.dart';

class ChangePasswordView extends GetView<ChangePassController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: ColorConstants.blue2,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 89.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 280.0,
                    ),
                    Image.asset('assets/images/LOGO-01.png', width: 70.0),
                  ],
                ),
              ),
              Text('Lupa sandi', style: Themes.darkTheme.textTheme.headline3),
              Text(
                'Masukkan sandi baru anda ',
                style: Themes.darkTheme.textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(
                height: 35.0,
              ),
              Text(
                'E-mail',
                style: Themes.darkTheme.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 4.0,
              ),
              const SizedBox(
                  height: 50.0,
                  child: PrimaryTextfield(
                    labelText: 'Cth. email-kamu@mail.com',
                    keyboardType: TextInputType.emailAddress,
                  )),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                'Kata sandi baru',
                style: Themes.darkTheme.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 4.0,
              ),
              SizedBox(
                  height: 50.0,
                  child: PrimaryTextfield(
                      onChanged: (value) {
                        controller.cekPowerPass(value);
                        // controller.passwordController;
                      },
                      obscureText: controller.passwordIsHidden.value,
                      suffixIcon: IconButton(
                        icon: controller.passwordIsHidden.value == true
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          controller.passwordIsHidden.toggle();
                        },
                      ))),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                '(Minimal 8 karakter dan gunakan kombinasi huruf dan angka)',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
              Obx(
                () => controller.powerPass.value != 0
                    ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 25,
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
              const SizedBox(height: 2),
              Obx(
                () => controller.powerPass.value != 0
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          controller.keterangan.value,
                          style: Themes.darkTheme.textTheme.titleSmall,
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                'Ulangi kata sandi',
                style: Themes.darkTheme.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 4.0,
              ),
              const SizedBox(
                  height: 50.0,
                  child: PrimaryTextfield(
                    labelText: 'Kata sandi',
                    keyboardType: TextInputType.emailAddress,
                  )),
              const SizedBox(
                height: 32.0,
              ),
              PrimaryButton(
                  color: ColorConstants.gray500,
                  label: 'Setel ulang kata sandi ',
                  onPressed: () {
                    Get.defaultDialog(
                        barrierDismissible: false,
                        radius: 25,
                        backgroundColor: Colors.white,
                        title: ' ',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/checkg.png',
                            ),
                            const SizedBox(
                              height: 28.0,
                            ),
                            Text(
                              'Kata sandi berhasil di ubah',
                              style: Themes.lightTheme.textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            const Text(
                              'Silahkan masuk kembali untuk memulai pembelajaran',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 45.0,
                            ),
                          ],
                        ),
                        actions: [
                          SizedBox(
                            height: 41.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstants.blue2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Masuk kembali',
                                style: Themes.darkTheme.textTheme.titleMedium,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 88.0,
                          ),
                        ]);
                  }),
            ]),
          ),
        ),
      )
    ]);
  }
}
