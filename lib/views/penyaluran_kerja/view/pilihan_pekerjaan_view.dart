import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/job/job_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';

import '../../../widgets/app_bar.dart';

class PilihanPekerjaanView extends GetView<JobController> {
  const PilihanPekerjaanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
        backButton: true,
        title: 'Pilihan Pekerjaan',
        withIconKG: true,
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 3.5,
                  crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.toNamed('/lowongan-kerja', arguments: state?[index].id);
                },
                child: Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0XFFd7d7d7),
                            offset: Offset(0, 1.3),
                            spreadRadius: 0.1,
                            blurRadius: 0.8)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0XFFD9D9D9),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0XFFfafafa),
                        ),
                        child: Image.network(
                            "${state?[index].company?.companyLogo}"),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state?[index].position}',
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontWeight: FontWeight.w700),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${state?[index].company?.companyName}',
                              style: Themes.lightTheme.textTheme.overline!
                                  .copyWith(color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '${state?[index].company?.location}',
                              style: Themes.lightTheme.textTheme.overline!
                                  .copyWith(color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(state?[index].salary)
                                  .toString(),
                              style: Themes.lightTheme.textTheme.overline!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
