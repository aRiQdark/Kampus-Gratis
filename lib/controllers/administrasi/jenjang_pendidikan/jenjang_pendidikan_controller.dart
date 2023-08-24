import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/utils/typedef.dart';

import '../../../themes/themes.dart';

class JenjangPendidikanController extends GetxController
    with StateMixin<AdministrasiModels?> {
  JenjangPendidikanController(this._administrasiProvider);
  final AdministrasiProvider _administrasiProvider;
  String? administrasiId;
  String? jenjangPendidikan;
  RxBool isLoading = false.obs;

  void setJP(String? newValue) {
    jenjangPendidikan = newValue;
  }

  Future getAdministrasi() async {
    try {
      AdministrasiModels? data = await _administrasiProvider.getAdministrasi();
      change(data, status: RxStatus.success());
      administrasiId = data?.administrationId;
      if (state?.degree != null) {
        jenjangPendidikan = state?.degree;
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future putDegree() async {
    JSON body = {
      "administration_id": administrasiId,
      "degree": jenjangPendidikan,
    };
    try {
      isLoading.value = true;
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Data Berhasil Disimpan",
                style: Themes.darkTheme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 13),
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              )
            ],
          ),
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 60),
          backgroundColor: const Color(0xFF3AAA35),
          duration: const Duration(seconds: 1),
          borderRadius: 8,
        ),
      );
      _administrasiProvider.putDegree(body);
      Get.toNamed('/verifikasi-akhir');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Perhatian !!!', 'Jenjang Pendidikan Belum Dipilih');
    }
  }

  @override
  void onInit() {
    getAdministrasi();
    super.onInit();
  }
}
