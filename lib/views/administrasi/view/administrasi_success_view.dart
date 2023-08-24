import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AdministrasiSuccess extends StatelessWidget {
  const AdministrasiSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 54,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xFFF3F3F3),
              child: Center(
                child: LinearPercentIndicator(
                  backgroundColor: const Color(0xFFD9D9D9),
                  animation: true,
                  lineHeight: 11,
                  animateFromLastPercent: true,
                  animationDuration: 1000,
                  percent: 100 / 100,
                  barRadius: const Radius.circular(8),
                  progressColor: const Color(0xFF3AAA35),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF15C8A8),
                    size: 50,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SvgPicture.asset(
                      "assets/icons/administrasi_success_icons.svg"),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Berhasil Mendaftar",
                    style: Themes.lightTheme.textTheme.headline3!
                        .copyWith(fontSize: 20, letterSpacing: 0),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              "Terima kasih! Kamu kini telah terdaftar menjadi ",
                          style: Themes.lightTheme.textTheme.subtitle2!
                              .copyWith(fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: "Mahasiswa Kampus Gratis ",
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: "Silakan Memilih Program Studi kamu ",
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 114),
                      height: 41,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed('/home');
                          Get.toNamed('/silabus');
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(235),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: const Color(0xFF106FA4),
                        ),
                        child: Text(
                          "Lanjut Ke Rencana Studi",
                          style: Themes.darkTheme.textTheme.subtitle2!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
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
