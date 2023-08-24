import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/silabus/detail_subject_controller.dart';

import '../../themes/themes.dart';
import '../../widgets/app_bar.dart';

class DetailSubjectView extends GetView<DetailSubjectController> {
  const DetailSubjectView({super.key});

  String semesterText(int semester) {
    if (semester % 2 == 0) {
      return '(Genap)';
    } else {
      return '(Ganjil)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
        backButton: true,
        title: 'Detail Matakuliah',
        withIconKG: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 33),
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Matakuliah : ',
                      style: Themes.lightTheme.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${Get.arguments[0]}',
                          style: Themes.lightTheme.textTheme.subtitle2!
                              .copyWith(fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Kode Matakulaih : ',
                      style: Themes.lightTheme.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text: '000372',
                          style: Themes.lightTheme.textTheme.subtitle2!
                              .copyWith(fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Semester : ',
                      style: Themes.lightTheme.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${Get.arguments[1]}',
                          style: Themes.lightTheme.textTheme.subtitle2!
                              .copyWith(fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Dosen Matakuliah : ',
                      style: Themes.lightTheme.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${Get.arguments[2]}',
                          style: Themes.lightTheme.textTheme.subtitle2!
                              .copyWith(fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
              ],
            ),
          ),
          controller.obx(
            (data) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(170),
                  1: FlexColumnWidth()
                },
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFFD9D9D9),
                  width: 1,
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        decoration: const BoxDecoration(
                          color: Color(0XFF3aaa35),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9),
                          ),
                        ),
                        child: SizedBox(
                          width: 110,
                          child: Text(
                            'Kompetensi Dasar',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Center(
                          child: Text('${data?.basicCompetencies}'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        color: const Color(0XFF3aaa35),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            'Indikator',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Center(
                          child: Text('${data?.indicator}'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        color: const Color(0XFF3aaa35),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            'Pengalaman Pembelajaran',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Center(
                          child: Text('${data?.studyExperience}'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        color: const Color(0XFF3aaa35),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            'Materi Ajar',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Center(
                          child: Text('${data?.teachingMaterials}'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        color: const Color(0XFF3aaa35),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            'Alat, Bahan, dan Sumber Ajar',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Center(
                          child: Text('${data?.toolsNeeded}'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        decoration: const BoxDecoration(
                          color: Color(0XFF3aaa35),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(9),
                          ),
                        ),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            'Penilaian',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Center(
                          child: Text('${data?.scoring}'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
