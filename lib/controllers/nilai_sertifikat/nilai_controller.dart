import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/nilai_sertifikat/nilai_model.dart';
import 'package:kampus_gratis/services/providers/nilai_sertifikat/nilai_provider.dart';

class NilaiController extends GetxController with StateMixin<NilaiModel?> {
  final nilaiProvider _nilaiProvider;
  NilaiController(this._nilaiProvider);

  final Color aNilai = Colors.greenAccent.shade400;
  final Color bNilai = Colors.yellowAccent.shade400;
  final Color cNilai = Colors.amberAccent;
  final Color dNilai = Colors.redAccent;

  // List<MaterialAccentColor> color = [
  //   Colors.cyanAccent,
  //   Colors.amberAccent,
  //   Colors.greenAccent,
  // ];

  RxBool isLoading = false.obs;

  Future getnilai() async {
    try {
      final data = await _nilaiProvider.getNilai();
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getnilai();
    super.onInit();
  }

  // Color? _changecolor() {
  //   for (var i = 0; i < state!.subject!.length; i++) {
  //     if (state!.subject![i].predicate == "A") {
  //       return color[2];
  //     } else {
  //       (state!.subject![i].predicate == "B+");
  //     }
  //     return color[1];
  //   }
  //   return null;
  // }
}
