import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PerencanaanKarirView extends StatefulWidget {
  const PerencanaanKarirView({
    Key? key,
  }) : super(key: key);

  @override
  State<PerencanaanKarirView> createState() => _PerencanaanKarirViewState();
}

class _PerencanaanKarirViewState extends State<PerencanaanKarirView> {
  bool analyze = false;
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Perencanaan Karir',
        withIconKG: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 51.0,
        ),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/Perencanaan Karir.svg'),
            const SizedBox(
              height: 33,
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Perencanaan Karir ',
                  style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'adalah fitur untuk mengetahui minat dan bakat kamu dalam hal Akademik, mulai analisa sekarang untuk melihat karir yang cocok dengan kemampuan kamu',
                      style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (analyze == true) ...[
              LinearPercentIndicator(
                percent: value,
                lineHeight: 20,
                backgroundColor: Colors.white,
                progressColor: const Color(0xFFFDB415),
                animation: true,
                animationDuration: 500,
                animateFromLastPercent: true,
                barRadius: const Radius.circular(100),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value == 1.0 ? 'Selesai' : 'Sedang Memuat Hasil',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
            PrimaryButton(
              label: 'Mulai Analisa',
              onPressed: () {
                analyze = true;
                analyzeCareer();
              },
              isExpand: false,
              color: Themes.lightTheme.primaryColor,
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 58,
            ),
          ],
        ),
      ),
    );
  }

  void analyzeCareer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          if (value == 1.0) {
            timer.cancel();
            Get.toNamed('/perencanaan-karir/hasil');
            value = 0.0;
            analyze = false;
          } else {
            value = value + 0.25;
          }
        });
      }
    });
  }
}
