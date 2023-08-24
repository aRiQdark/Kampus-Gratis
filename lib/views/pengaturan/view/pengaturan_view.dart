import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/views/pengaturan/component/toggle_tema.dart';
import 'package:kampus_gratis/widgets/primary_button_action_icon.dart';

class PengaturanView extends StatelessWidget {
  const PengaturanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: theme.appBarTheme.backgroundColor,
        // Get.isDarkMode ? ColorConstants.gray400 : ColorConstants.blue1,
        leading: Padding(
          padding: const EdgeInsets.only(left: kSpacing),
          child: IconButton(
            onPressed: (() {
              Get.back();
            }),
            icon: const Icon(Icons.arrow_back_ios),
            // iconSize: 40,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Pengaturan',
          style: theme.textTheme.headline5!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Get.isDarkMode
                  ? const AssetImage('assets/images/BGProfile2.png')
                  : const AssetImage('assets/images/BGProfile.png'),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                left: kSpacing,
                right: kSpacing,
                top: kPadding,
                bottom: kPadding,
              ),
              child: Column(
                children: [
                  PrimaryButtonActionIcon(
                    text: 'Edit Profil',
                    icon: 'assets/icons/Pendaftaran_Pendaftaran.png',
                    press: () {},
                  ),
                  const SizedBox(height: kSpacing1),
                  PrimaryButtonActionIcon(
                    text: 'Ubah Password',
                    icon: 'assets/icons/Pendaftaran_Pendaftaran.png',
                    press: () {
                      Get.toNamed('/reset-password');
                    },
                  ),
                  const SizedBox(height: kSpacing1),
                  PrimaryButtonActionIcon(
                    text: 'Izin Akses',
                    icon: 'assets/icons/Pendaftaran_Pendaftaran.png',
                    press: () {
                      AppSettings.openAppSettings();
                    },
                  ),
                  const SizedBox(height: kSpacing1),
                  Container(
                    padding: const EdgeInsets.all(kPadding1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius1),
                      color: Get.isDarkMode
                          ? ColorConstants.gray400
                          : ColorConstants.gray50,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/Pendaftaran_Pendaftaran.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: kPadding),
                        Expanded(
                          child: Text(
                            'Tema',
                            style: theme.textTheme.button!.copyWith(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        ToggleTema(),
                      ],
                    ),
                  ),
                  const SizedBox(height: kSpacing1),
                  Container(
                    padding: const EdgeInsets.all(kPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius1),
                      color: Get.isDarkMode
                          ? ColorConstants.gray400
                          : ColorConstants.gray50,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/google.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: kPadding),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Google',
                                style: theme.textTheme.button!.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: kSpacing1 / 2),
                              Text(
                                'mknowsconsulting1@gmail.com',
                                style: theme.textTheme.caption!.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Tersambung',
                          style: theme.textTheme.caption!.copyWith(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
