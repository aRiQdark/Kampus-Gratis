import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/widgets/button_menu.dart';

class BerandaController extends GetxController {
  RxBool isExpanded = false.obs;
  late ScrollController scrollController;

  var listButton = <Widget>[
    const ButtonMenu(
      imgAssets: 'assets/icons/administrasi.svg',
      title: 'Administrasi',
      routes: '/data-diri',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/silabus_icons.svg',
      title: 'Rencana Studi',
      routes: '/fakultas',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/studi_icons.svg',
      title: 'Studi-Ku',
      routes: '/studiku/main',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/nilai_sertifikat.svg',
      title: 'Nilai & Sertifikat',
      routes: '/nilai_sertifikat',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/assignment.svg',
      title: 'Penugasan',
      routes: '/home/assignment',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/discuss_icons.svg',
      title: 'Diskusi Perkuliahan',
      routes: '/discussion_global',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/konsultasi_layanan.svg',
      title: 'Konsultasi dan Layanan',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/load_more_icons.svg',
      title: 'Fitur Lainnya',
      func: true,
      routes: '',
    ),
  ].obs;

  var listButtonExpanded = <Widget>[
    const ButtonMenu(
      imgAssets: 'assets/icons/administrasi.svg',
      title: 'Administrasi',
      routes: '/data-diri',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/silabus_icons.svg',
      title: 'Rencana Studi',
      routes: '/silabus',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/studi_icons.svg',
      title: 'Studi-Ku',
      routes: '/studiku/main',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/nilai_sertifikat.svg',
      title: 'Nilai & Sertifikat',
      routes: '/nilai_sertifikat',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/assignment.svg',
      title: 'Penugasan',
      routes: '/home/assignment',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/discuss_icons.svg',
      title: 'Diskusi Perkuliahan',
      routes: '/discussion_global',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/konsultasi_layanan.svg',
      title: 'Konsultasi dan Layanan',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/ruang_simulasi.svg',
      title: 'Simulasi, Drill & Assessment',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/kalender_saya.svg',
      title: 'Kalender Saya',
      routes: '/Kalender-saya',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/papan_skor.svg',
      title: 'Papan Skor',
      routes: '/scoreboard',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/analitik.svg',
      title: 'Analitik',
      routes: '/analitik',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/help.svg',
      title: 'Panduan',
      routes: '/panduan',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/sekilas_ilmu.svg',
      title: 'Sekilas Ilmu',
      routes: '/artikel',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/acara_kampus.svg',
      title: 'Acara Kampus',
      routes: '/Acara-kampus',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/perencanaan_karir.svg',
      title: 'Perencanaan Karir',
      routes: '/perencanaan-karir',
      studentOnly: true,
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/jobstreet_icons.svg',
      title: 'Penyaluran Kerja',
      routes: '/penyaluran-kerja',
    ),
    const ButtonMenu(
      imgAssets: 'assets/icons/minimize_icons.svg',
      title: 'Lebih sedikit',
      func: false,
      routes: '',
    ),
  ].obs;

  loadMore() {
    isExpanded.value = true;
    scrollController.position.animateTo(175,
        curve: Curves.easeOutQuint, duration: const Duration(seconds: 1));
  }

  minimize() {
    isExpanded.value = false;
    scrollController.position.animateTo(0,
        curve: Curves.easeOutQuint, duration: const Duration(seconds: 1));
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
