import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/job/detail_job_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/views/penyaluran_kerja/components/job_description.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class JobDetailsView extends GetView<DetailJobController> {
  const JobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
          backButton: true, title: "Detail Lowongan", withIconKG: true),
      body: controller.obx(
        (state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state?.position}",
                                  style: Themes.lightTheme.textTheme.headline6!
                                      .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "${state?.company?.companyName}",
                                  style: Themes.lightTheme.textTheme.caption!
                                      .copyWith(
                                    fontSize: 10,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child:
                                Image.network("${state?.company?.companyLogo}"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/maps.svg"),
                          const SizedBox(
                            width: 9,
                          ),
                          Text("${state?.company?.location}",
                              style: Themes.lightTheme.textTheme.caption)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/money.svg"),
                          const SizedBox(
                            width: 9,
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(state?.salary).toString(),
                            style: Themes.lightTheme.textTheme.caption,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hari Kerja",
                                style: Themes.lightTheme.textTheme.caption!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${state?.workDays}",
                                style: Themes.lightTheme.textTheme.caption,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jam Kerja",
                                style: Themes.lightTheme.textTheme.caption!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${state?.workHour}",
                                style: Themes.lightTheme.textTheme.caption,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Waktu Kerja",
                                style: Themes.lightTheme.textTheme.caption!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${state?.period}",
                                style: Themes.lightTheme.textTheme.caption,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi Pekerjaan',
                        style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state?.requirements?.length,
                        itemBuilder: (context, index) {
                          return JobDescription(
                            title: state?.requirements?[index],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Lamar disini    ",
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: "${state?.url}",
                              style:
                                  Themes.lightTheme.textTheme.caption!.copyWith(
                                color: ColorConstants.mainBlue,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  if (state?.url != null) {
                                    controller.applyUrl(Uri.parse(state!.url!));
                                  }
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
