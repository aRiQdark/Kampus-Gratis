import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CardSubject extends StatelessWidget {
  final String kodeMK;
  final int? jmlMhs;
  final String nameMK;
  final String nameDosen;
  final int? sks;
  final String type;
  final int? progress;
  final List? arguments;
  const CardSubject({
    Key? key,
    required this.kodeMK,
    required this.jmlMhs,
    required this.nameMK,
    required this.nameDosen,
    required this.sks,
    required this.type,
    required this.progress,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: InkWell(
        onTap: () => Get.toNamed(
          '/studiku/session',
          arguments: arguments,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        kodeMK,
                        style: Themes.lightTheme.textTheme.subtitle1?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '$jmlMhs Mahasiswa',
                        style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    nameMK,
                    style: Themes.lightTheme.textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          nameDosen,
                          style:
                              Themes.lightTheme.textTheme.subtitle1!.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorConstants.mainColorYellow,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            '$sks SKS',
                            style:
                                Themes.lightTheme.textTheme.subtitle1!.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorConstants.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            type,
                            style: Themes.lightTheme.textTheme.subtitle1!
                                .copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: ColorConstants.mainBlue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: LinearPercentIndicator(
                  backgroundColor: Colors.white,
                  animation: true,
                  lineHeight: 25,
                  animateFromLastPercent: true,
                  animationDuration: 1000,
                  percent: progress! / 100,
                  center: Text('$progress %'),
                  barRadius: const Radius.circular(10),
                  progressColor: ColorConstants.indicator,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // LinearPercentIndicator(
  //     {required Color backgroundColor,
  //     required bool animation,
  //     required int lineHeight,
  //     required bool animateFromLastPercent,
  //     required int animationDuration,
  //     required double percent,
  //     required Text center,
  //     required Radius barRadius,
  //     required Color progressColor}) {}
}
