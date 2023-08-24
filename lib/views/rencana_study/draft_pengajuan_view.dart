import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/draft_krs_controller.dart';
import '../../themes/themes.dart';
import '../../widgets/app_bar.dart';

class DraftPengajuanView extends GetView<DraftKrsController> {
  const DraftPengajuanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
        backButton: true,
        title: 'Pengajuan Berkas',
        withIconKG: true,
      ),
      body: controller.obx(
        (state) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Jurusan : ',
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
                    height: 2,
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
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Jumlah Matakuliah Semester ini : ',
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
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Kepala Prodi : ',
                        style: Themes.lightTheme.textTheme.subtitle2!
                            .copyWith(fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${Get.arguments[3]}',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Table(
              border: TableBorder.all(
                color: const Color(0xff383838),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(30),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
                5: FlexColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: 30,
                        color: const Color(0XFF3aaa35),
                        child: Center(
                          child: Text(
                            "No",
                            style: Themes.lightTheme.textTheme.overline!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: 30,
                        color: const Color(0XFF3aaa35),
                        child: Center(
                          child: Text(
                            "Kode\n Matakuliah",
                            style: Themes.lightTheme.textTheme.overline!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: 30,
                        color: const Color(0XFF3aaa35),
                        child: Center(
                          child: Text(
                            "Nama\n Matakuliah",
                            style: Themes.lightTheme.textTheme.overline!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: 30,
                        color: const Color(0XFF3aaa35),
                        child: Center(
                          child: Text(
                            "SKS",
                            style: Themes.lightTheme.textTheme.overline!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: 30,
                        color: const Color(0XFF3aaa35),
                        child: Center(
                          child: Text(
                            "Keterangan",
                            style: Themes.lightTheme.textTheme.overline!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 30,
                        color: const Color(0XFF3aaa35),
                        child: Center(
                          child: Text(
                            "Status",
                            style: Themes.lightTheme.textTheme.overline!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.all(
                color: const Color(0xff383838),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(30),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth()
              },
              children: controller.ongoingSubject
                  .asMap()
                  .entries
                  .map(
                    (ongoingDraft) => TableRow(
                      children: [
                        Text(
                          "${ongoingDraft.key + 1}",
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "PE001",
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          ongoingDraft.value.name ?? '',
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${ongoingDraft.value.credit}",
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "Wajib",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.check_circle_outline_outlined,
                              color: Color(0xff289626),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'disetujui',
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontSize: 6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Table(
              border: TableBorder.all(
                color: const Color(0xff383838),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(30),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth()
              },
              children: controller.pendingSubject
                  .asMap()
                  .entries
                  .map(
                    (pendingSubject) => TableRow(
                      children: [
                        Text(
                          "${pendingSubject.key + 1}",
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "PE001",
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          pendingSubject.value.name ?? '',
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${pendingSubject.value.credit}",
                          style: Themes.lightTheme.textTheme.overline!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "Wajib",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.timelapse_rounded,
                              color: Color(0xff636161),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Menunggu disetujui',
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontSize: 6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text:
                      '*Anda dapat melihat mata kuliah yang telah disetujui di fitur ',
                  style: Themes.lightTheme.textTheme.caption!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Studi-ku',
                      style: Themes.lightTheme.textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF106fa4),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
