import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_buku_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_card.dart';

// final List bukuPanduan = [
//   [
//     'Panduan Tutorial Aplikasi',
//     const BukuPanduanDetail(
//       title: 'Panduan Tutorial Aplikasi',
//       description:
//           '''Desain web itu rumit. Kita harus mempertimbangkan banyak hal saat merancang sebuah situs web, dari tampilan visual (bagaimana tampilan situs web) ke desain fungsional (bagaimana situs web bekerja).
//           Saat ini, website sudah makin menjadi kompleks. Sama seperti fashion, desain website pun selalu berubah-ubah mengikuti tren.
//           Tentu saja dengan semakin kompleks desain web di jaman sekarang, semakin sulit juga bagi Anda para web developer untuk membangun sebuah website dari nol. Ide-ide klien sendiri pun sudah semakin rumit dan bermacam-macam.
//           Maka dari itu, Anda memerlukan cara perencanaan dan langkah-langkah kerja yang bisa membantu Anda untuk mengerjakan proyek desain web dengan lebih efisien.
//           Tentu saja dengan semakin kompleks desain web di jaman sekarang, semakin sulit juga bagi Anda para web developer untuk membangun sebuah website dari nol. Ide-ide klien sendiri pun sudah semakin rumit dan bermacam-macam''',
//     ),
//   ],
//   [
//     'Panduan Pendaftaran Akun dan Mahasiswa',
//     const BukuPanduanDetail(
//       title: 'Panduan Pendaftaran Akun dan Mahasiswa',
//       description:
//           '''Desain web itu rumit. Kita harus mempertimbangkan banyak hal saat merancang sebuah situs web, dari tampilan visual (bagaimana tampilan situs web) ke desain fungsional (bagaimana situs web bekerja).
//           Saat ini, website sudah makin menjadi kompleks. Sama seperti fashion, desain website pun selalu berubah-ubah mengikuti tren.
//           Tentu saja dengan semakin kompleks desain web di jaman sekarang, semakin sulit juga bagi Anda para web developer untuk membangun sebuah website dari nol. Ide-ide klien sendiri pun sudah semakin rumit dan bermacam-macam.
//           Maka dari itu, Anda memerlukan cara perencanaan dan langkah-langkah kerja yang bisa membantu Anda untuk mengerjakan proyek desain web dengan lebih efisien.
//           Tentu saja dengan semakin kompleks desain web di jaman sekarang, semakin sulit juga bagi Anda para web developer untuk membangun sebuah website dari nol. Ide-ide klien sendiri pun sudah semakin rumit dan bermacam-macam''',
//     ),
//   ],
// ];

class BukuPanduan extends GetView<PanduanBukuController> {
  const BukuPanduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buku Panduan',
          style: Themes.darkTheme.textTheme.headline6!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2995B2),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OVERVIEW',
                style: Themes.lightTheme.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Berupa buku petunjuk penggunaan dan pengertian fitur-fitur yang ada di Mobile Apps KG secara terperinci (isinya lebih detail jika dibandingkan video tutorial). Menjelaskan juga keunggulan dan manfaat fitur tersebut.',
                style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              controller.obx(
                (data) => Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: data!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return PanduanCard(
                        id: data[index].id!,
                        title: data[index].title!,
                        description: data[index].description!,
                        icon: Icons.insert_drive_file_outlined,
                        destination: '/panduan/buku/detail',
                        imageLink: data[index].content!.imageLink!,
                        text: data[index].content!.text!,
                      );
                      // return Column(
                      //   children: [
                      //     Text(data[index].title!),
                      //     Text(data[index].id!),
                      //     Text(data[index].description!),
                      //     Text(data[index].content!.imageLink!),
                      //     Text(data[index].content!.text!),
                      //   ],
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
