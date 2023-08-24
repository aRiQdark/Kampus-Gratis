import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_card_second.dart';

class KamusKGScreen extends GetView<PanduanController> {
  const KamusKGScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kamus KG',
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
                'Kumpulan definisi singkat dari istilah dan akronim yang digunakan di Mobile Aplikasi Kampus Gratis.',
                style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 400,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.daftarKamus.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return PanduanCardSecond(
                      title: controller.daftarKamus[index][0],
                      subtitle: controller.daftarKamus[index][1],
                      destination: controller.daftarKamus[index][2],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
