import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/views/penyaluran_kerja/components/option_button.dart';

import '../../../themes/themes.dart';
import '../../../widgets/app_bar.dart';

class PenyaluranKerjaView extends StatelessWidget {
  const PenyaluranKerjaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
        backButton: true,
        title: 'Penyaluran Kerja',
        withIconKG: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('/pilihan-pekerjaan', arguments: []);
        },
        backgroundColor: Themes.lightTheme.primaryColor,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 55),
        label: Text(
          'Lihat Semua',
          style: Themes.lightTheme.textTheme.button,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OptionButton(
                    height: 198,
                    imageUrl: 'assets/images/penyaluran_kerja1.png',
                    title: 'Mitra Kami',
                    onTap: () => Get.toNamed('/pilihan-pekerjaan',
                        arguments: ["sponsored"]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OptionButton(
                    height: 255,
                    imageUrl: 'assets/images/penyaluran_kerja3.png',
                    title: 'Finance & Accounting',
                    onTap: () => Get.toNamed('/pilihan-pekerjaan',
                        arguments: ["finance"]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OptionButton(
                    height: 255,
                    imageUrl: 'assets/images/penyaluran_kerja2.png',
                    title: 'Design Digital & Creative',
                    onTap: () => Get.toNamed('/pilihan-pekerjaan',
                        arguments: ["design"]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OptionButton(
                    height: 198,
                    imageUrl: 'assets/images/penyaluran_kerja4.png',
                    title: 'Teknologi & Programming',
                    onTap: () => Get.toNamed('/pilihan-pekerjaan',
                        arguments: ["programming"]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
