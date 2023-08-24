import 'package:get/get.dart';

class PanduanController extends GetxController {
  final List daftarPanduan = [
    [
      'Buku Panduan',
      'Panduan ini berisi dokumen-dokumen panduan.',
      '/panduan/buku',
    ],
    [
      'Video Panduan',
      'Panduan ini berisi video-video panduan.',
      '/panduan/video',
    ],
    [
      'Kamus KG',
      'Panduan ini berisi konten kampus gratis.',
      '/panduan/kamus_kg',
    ],
  ];

  final List daftarKamus = [
    [
      'Kamus Aplikasi',
      'Berisi istilah dan akronim yang digunakan.',
      '/panduan/kamus_kg/aplikasi',
    ],
    [
      'Glosarium Materi Credit',
      'Berisi kumpulan.',
      '/panduan/kamus_kg/kuliah',
    ],
  ];
}
