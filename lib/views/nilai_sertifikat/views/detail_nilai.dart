import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/nilai_controller.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

import '../../../themes/themes.dart';

class RangkumanNilaiView extends GetView<NilaiController> {
  const RangkumanNilaiView({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
        appBar: const KGAppBar(
          backButton: true,
          title: 'Detail Nilai',
          withIconKG: true,
        ),
        body: controller.obx(
          (state) => SingleChildScrollView(
            controller: ScrollController(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 1000,
                    child: ListView.builder(
                      itemCount: state?.subject?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 9,
                                    width: 9,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff3AAA35),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Semester ${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                columnWidths: const <int, TableColumnWidth>{
                                  1: FixedColumnWidth(50),
                                  2: FixedColumnWidth(50),
                                  3: FlexColumnWidth()
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        color: const Color(0XFF106FA4),
                                        child: Text(
                                          "Mata Kuliah",
                                          style: Themes
                                              .lightTheme.textTheme.caption!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        color: const Color(0XFF106fa4),
                                        child: Text(
                                          "Nilai",
                                          style: Themes
                                              .lightTheme.textTheme.caption!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        color: const Color(0XFF106fa4),
                                        child: Text(
                                          "Grade",
                                          style: Themes
                                              .lightTheme.textTheme.caption!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height:50,
                                child: ListView.builder(
                                  itemCount: state?.subject?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Table(
                                        border: TableBorder.all(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                        defaultVerticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        columnWidths: const <int,
                                            TableColumnWidth>{
                                          1: FixedColumnWidth(50),
                                          2: FixedColumnWidth(50),
                                          3: FlexColumnWidth()
                                        },
                                        children: [
                                          TableRow(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: SizedBox(
                                                  height: 10,
                                                  child: Text(
                                                    ' ${state?.subject?[index].name}',
                                                    style: Themes.lightTheme
                                                        .textTheme.subtitle2!
                                                        .copyWith(fontSize: 10),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${state?.subject?[index].score}",
                                                style: Themes.lightTheme
                                                    .textTheme.subtitle2!
                                                    .copyWith(fontSize: 10),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "${state?.subject?[index].predicate}",
                                                style: Themes.lightTheme
                                                    .textTheme.subtitle2!
                                                    .copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ]);
                                  },
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
