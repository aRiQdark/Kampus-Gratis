import 'package:flutter/material.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class GradeTranscriptView extends StatelessWidget {
  const GradeTranscriptView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: "Transkrip Nilai",
        withIconKG: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
          child: Column(
            children: [
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(200),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                },
                border: TableBorder.all(color: ColorConstants.greyTextField),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: ColorConstants.mainBlue),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Text(
                              "Mata Kuliah",
                              style: Themes.darkTheme.textTheme.subtitle2!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Text(
                            "Nilai",
                            style: Themes.darkTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Text(
                            "Grade",
                            style: Themes.darkTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(200),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                },
                border: TableBorder.all(color: ColorConstants.greyTextField),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: transkrip.asMap().entries.map((data) {
                  return TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Center(
                            child: Text(
                              data.value.mataKuliah,
                              style: Themes.lightTheme.textTheme.overline!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Text(
                            "${data.value.nilai}",
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Text(
                            data.value.grade,
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TranskripNilai {
  String mataKuliah, grade;
  int nilai;
  TranskripNilai(this.mataKuliah, this.nilai, this.grade);
}

List<TranskripNilai> transkrip = [
  TranskripNilai(
      '[2] Accounting 1 - Pembiayaan dan Optimalisasi Bisnis - 001002003 ',
      87,
      'A'),
  TranskripNilai(
      '[2] Accounting 1 - Pembiayaan dan Optimalisasi Bisnis - 001002003 ',
      87,
      'A'),
  TranskripNilai(
      '[2] Accounting 1 - Pembiayaan dan Optimalisasi Bisnis - 001002003 ',
      87,
      'A'),
  TranskripNilai(
      '[2] Accounting 1 - Pembiayaan dan Optimalisasi Bisnis - 001002003 ',
      87,
      'A'),
];
