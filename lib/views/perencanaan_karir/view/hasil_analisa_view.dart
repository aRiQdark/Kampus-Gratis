import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/perencanaan_karir/perencanaan_karir_controller.dart';
import 'package:kampus_gratis/views/perencanaan_karir/components/card_learning_path.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:kampus_gratis/themes/themes.dart';

class HasilAnalisaView extends GetView<PerencanaanKarirController> {
  const HasilAnalisaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
          backButton: true, title: 'Hasil Analisa', withIconKG: true),
      body: controller.obx(
        (state) => SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 31),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 323,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 31,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 80,
                      lineWidth: 20,
                      percent: state!.accuracy / 100,
                      animation: true,
                      animationDuration: 2000,
                      backgroundColor: Colors.white,
                      linearGradient: const LinearGradient(
                        colors: [
                          Color(0xFFFDB415),
                          Color(0xFFE5F52F),
                          Color(0xFF16D3FD),
                        ],
                        stops: [0.3, 0.5, 0.7],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      curve: Curves.easeIn,
                      center: Text(
                        '${state.accuracy} %',
                        style: Themes.lightTheme.textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Karir yang cocok untuk kamu adalah\n\n',
                        style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '"${state.career}"',
                            style:
                                Themes.lightTheme.textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToLastDescent: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              RichText(
                text: TextSpan(
                  text: 'Pelajari Selengkapnya untuk menjadi\n\n',
                  style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: state.career,
                      style: Themes.lightTheme.textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.remainingSubjects.length,
                itemBuilder: (context, index) {
                  return CardLearningPath(
                    kodeMK: '000372',
                    nameDosen: 'Kenniskiu Fortino Kurniawan',
                    nameMK: state.remainingSubjects[index],
                    sks: 3,
                    type: 'Wajib',
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                label: 'Ayo Wujudkan Impianmu',
                isExpand: false,
                color: Themes.lightTheme.primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  Get.toNamed('/silabus');
                },
              )
            ],
          ),
        ),
        onLoading: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 31.0,
          ),
          children: [
            const ShimmerLoading(
              shape: ShimmerShape.circle,
              radius: 80,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ShimmerLoading(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ShimmerLoading(),
            ),
            const SizedBox(
              height: 84,
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ShimmerLoading(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ShimmerLoading(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ShimmerLoading(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ShimmerLoading(),
            ),
          ],
        ),
        onError: (error) => Text('$error'),
      ),
    );
  }
}
