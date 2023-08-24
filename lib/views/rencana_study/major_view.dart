import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/silabus_controller.dart';
import 'package:kampus_gratis/views/rencana_study/components/jurusan_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

import '../../themes/themes.dart';

class MajorView extends GetView<SilabusController> {
  const MajorView({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
        backButton: true,
        title: 'Rencana Studi',
        withIconKG: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text(
              'Pilihan Program Studi',
              style: Themes.lightTheme.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Expanded(
            child: controller.obx(
              (data) => ListView.builder(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
                itemCount: data!.isNotEmpty ? data.length : 0,
                itemBuilder: (context, index) => data.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed('/detail-jurusan', arguments: [
                            data[index].id,
                            data[index].name,
                            'Test',
                            'Test'
                            // data?[index].numberOfSubjects,
                            // data?[index].lecturer?.user?.fullName
                          ]);
                        },
                        child: JurusanCard(
                          name: data[index].name ?? 'null',
                          description: data[index].description ?? 'null',
                          lecturerName:
                              // data?[index].lecturer?.user?.fullName ??
                              'null',
                          numberOfSubjects:
                              // data?[index].numberOfSubjects ??
                              'null',
                          thumbnailLink: data[index].thumbnailLink ?? 'null',
                        ),
                      )
                    : const Center(
                        child: Text(
                          'Data Kosong',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
              ),
              onLoading: ListView.builder(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 11),
                    child: const ShimmerLoading(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
