import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/faculty_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/rencana_study/components/fakultas_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

class FakultasView extends GetView<FacultyController> {
  const FakultasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
          backButton: true, title: "Rencana Studi", withIconKG: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text(
              'Pilihan Fakultas',
              style: Themes.lightTheme.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: controller.obx(
              (data) => ListView.builder(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.checktStudentId(context, '${data?[index].id}');
                      // Get.toNamed('/prodi', arguments: );
                      // print('FAKULTAS ID: ${data?[index].id}');
                    },
                    child: FakultasCard(
                      name: data?[index].name ?? 'null',
                      description: 'null',
                      lecturerName: 'null',
                      numberOfSubjects: 'null',
                      thumbnailLink: 'null',
                    ),
                  );
                },
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
