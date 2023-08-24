import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/models/silabus/fakultas_model.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';

import '../../themes/themes.dart';
import '../../widgets/dialog.dart';

class FacultyController extends GetxController with StateMixin<List<Datum>> {
  FacultyController(
    this._silabusViewProvider,
  );
  final SilabusViewProvider _silabusViewProvider;

  final alertStorage = GetStorage();

  getAllFaculty() async {
    try {
      final faculty = await _silabusViewProvider.getAllFaculty();
      change(faculty, status: RxStatus.success());
      alertStorage.writeIfNull('isShown', true);
      if (alertStorage.read('isShown') == true) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            return showDialog(
              context: Get.context!,
              builder: (ctx) => Center(
                child: Container(
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/LogoKGBiru.png',
                        height: 45,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Selamat datang!',
                        textAlign: TextAlign.center,
                        style: Themes.lightTheme.textTheme.headline6!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0XFF1C1B1F),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Silakan pilih fakultas yang sesuai dengan minat kamu',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: Themes.lightTheme.textTheme.caption!.copyWith(
                            fontSize: 12, color: const Color(0XFF1C1B1F)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 248,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () async {
                            await alertStorage.write('isShown', false);
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF106fa4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          child: Text(
                            'Mulai',
                            style: Themes.lightTheme.textTheme.button,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  checktStudentId(BuildContext context, String arguments) {
    final localStorage = GetStorage();
    final role = localStorage.read('role');
    if (role == 'guest') {
      showDialog(
        context: context,
        builder: (ctx) => KGDialog(
          filePath: 'assets/icons/exclamation_sign.svg',
          title: 'Anda belum melakukan pendaftaran',
          middleText: 'Silakan lengkapi informasi data diri untuk melanjutkan',
          textConfirm: 'Lengkapi sekarang',
          onConfirm: () {
            Get.back();
            Get.toNamed('/administrasi');
          },
          textCancel: 'Nanti',
          onCancel: () => Get.back(),
        ),
      );
    } else {
      Get.toNamed('/prodi', arguments: arguments);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllFaculty();
  }
}
