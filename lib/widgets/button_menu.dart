import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/controllers/beranda/beranda_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/dialog.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class ButtonMenu extends GetView<BerandaController> {
  final String imgAssets;
  final String title;
  final String? routes;
  final bool? func;
  final bool? studentOnly;
  const ButtonMenu({
    Key? key,
    required this.imgAssets,
    required this.title,
    this.routes,
    this.studentOnly,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runSpacing: 9,
        children: [
          InkWell(
            onTap: () {
              if (routes == null) {
                KGSnackBar.showKGSnackBar(context, 'Fitur belum tersedia');
              }

              if (routes != null || routes != '') {
                if (studentOnly == true) {
                  final localStorage = GetStorage();
                  var role = localStorage.read('role');

                  if (role == 'student') {
                    if (routes!.contains('mylearning') ||
                        routes!.contains('assignment')) {
                      Get.offNamed(routes!);
                    } else {
                      Get.toNamed(routes!);
                    }
                  } else {
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
                  }
                } else {
                  if (func == true && controller.isExpanded.value == false) {
                    controller.loadMore();
                  } else {
                    if (func == false && controller.isExpanded.value == true) {
                      controller.minimize();
                    }
                  }

                  if (routes != '' && routes != null) Get.toNamed(routes!);
                }
              }
            },
            child: FadeIn(
              duration: const Duration(seconds: 1),
              child: SizedBox(
                height: 60,
                width: 60,
                child: SvgPicture.asset(
                  imgAssets,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          SizedBox(
            height: 24,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Themes.lightTheme.textTheme.overline!
                  .copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.3),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
