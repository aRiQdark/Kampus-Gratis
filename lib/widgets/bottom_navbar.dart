import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/dialog.dart';

class KGBottomNavBar extends StatelessWidget {
  final int menuIndex;

  const KGBottomNavBar(
    this.menuIndex, {
    super.key,
  });

  Color colorByIndex(int index) {
    return index == menuIndex
        ? ColorConstants.mainColorBlue
        : ColorConstants.gray100;
  }

  BottomNavigationBarItem getItem(String title, String icon, int index) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: SvgPicture.asset(
            'assets/icons/$icon.svg',
            color: colorByIndex(index),
          ),
        ),
        label: title,
        tooltip: title);
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> menuItems = [
      getItem('Beranda', 'home_5', 0),
      getItem('Studi-Ku', 'school', 1),
      getItem('Penugasan', 'assignment_icon', 2),
      getItem('Profil', 'user_3', 3)
    ];

    GetStorage storage = GetStorage();
    String? role = storage.read('role');

    return SizedBox(
      height: 80.0,
      child: BottomNavigationBar(
        selectedItemColor: ColorConstants.mainBlue,
        unselectedItemColor: ColorConstants.gray100,
        selectedLabelStyle: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
            color: ColorConstants.mainBlue),
        unselectedLabelStyle: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
            color: ColorConstants.gray50),
        items: menuItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: menuIndex,
        backgroundColor: Colors.white,
        elevation: 16.0,
        onTap: (value) {
          switch (value) {
            case 0:
              Get.offNamed('/home');
              break;
            case 1:
              if (role != null) {
                if (role != 'student') {
                  showDialog(
                      context: context,
                      builder: (context) => KGDialog(
                            filePath: 'assets/icons/exclamation_sign.svg',
                            title: 'Tidak bisa melanjutkan',
                            middleText:
                                'Anda belum terdaftar menjadi Mahasiswa, silahkan mendaftar terlebih dahulu',
                            textConfirm: 'Daftar sekarang',
                            onConfirm: () {
                              Get.back();
                              Get.toNamed('/data-diri');
                            },
                            textCancel: 'Nanti',
                            onCancel: () => Get.back(),
                          ));
                } else {
                  Get.offNamed('/studiku/main');
                }
              }
              break;
            case 2:
              if (role != null) {
                if (role != 'student') {
                  showDialog(
                      context: context,
                      builder: (context) => KGDialog(
                            filePath: 'assets/icons/exclamation_sign.svg',
                            title: 'Tidak bisa melanjutkan',
                            middleText:
                                'Anda belum terdaftar menjadi Mahasiswa, silahkan mendaftar terlebih dahulu',
                            textConfirm: 'Daftar sekarang',
                            onConfirm: () {
                              Get.back();
                              Get.toNamed('/data-diri');
                            },
                            textCancel: 'Nanti',
                            onCancel: () => Get.back(),
                          ));
                } else {
                  Get.offNamed('/home/assignment');
                }
              }
              break;
            case 3:
              Get.offNamed('/profil');
              break;
          }
        },
      ),
    );
  }
}
