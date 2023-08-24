import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/draft_krs_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';

import '../../widgets/app_bar.dart';

class DraftKrsView extends GetView<DraftKrsController> {
  const DraftKrsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0XFFf3f3f3),
          appBar: const KGAppBar(
            backButton: true,
            title: 'Draft KRS',
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
                    color: Colors.black,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(40),
                    1: FixedColumnWidth(100),
                    2: FixedColumnWidth(130),
                    3: FlexColumnWidth()
                  },
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106fa4),
                        child: Text(
                          "No. ",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106fa4),
                        child: Text(
                          "Kode MataKul",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106fa4),
                        child: Text(
                          "Nama Matakul",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106fa4),
                        child: Text(
                          "Edit",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
                  ],
                ),
                Table(
                  border: TableBorder.all(
                    color: Colors.black,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(40),
                    1: FixedColumnWidth(100),
                    2: FixedColumnWidth(130),
                    3: FlexColumnWidth()
                  },
                  children: controller.draftSubject.asMap().entries.map(
                    (data) {
                      return TableRow(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${data.key + 1}.",
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            "Kode001",
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            data.value.name!,
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.defaultDialog(
                                barrierDismissible: false,
                                radius: 25,
                                backgroundColor: Colors.white,
                                title: 'Konfirmasi',
                                titleStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                middleText: 'Hapus Matakuliah',
                                middleTextStyle:
                                    const TextStyle(color: Colors.black),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text(
                                      'Batal',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 46,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.deleteMatkul(
                                        data.value.subjectId!,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text(
                                      'Hapus',
                                    ),
                                  ),
                                ],
                              );
                            },
                            child: Text(
                              'Hapus',
                              style: Themes.lightTheme.textTheme.caption!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'SKS diambil = ${state!.subjectsEnrolled!.draft?.credit == null ? 0 : state.subjectsEnrolled!.draft?.credit} SKS',
                  style: Themes.lightTheme.textTheme.button!
                      .copyWith(color: Colors.black, fontSize: 12),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LimitedBox(
                      maxWidth: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27a744),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                "KONFIRMASI",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              content: const Text(
                                "Ajukan KRS ke Dosen Pembimbing?",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 5,
                                        ),
                                        width: 71,
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red),
                                        child: const Text(
                                          "Batal",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (() {
                                        controller.sendDraft();
                                        Get.back();
                                        Future.delayed(
                                            const Duration(
                                              seconds: 1,
                                            ), () {
                                          Get.back();
                                          Get.toNamed('pengajuan-berkas');
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (context) => SizedBox(
                                            width: 208,
                                            height: 125,
                                            child: AlertDialog(
                                              title: const Text(
                                                "Berhasil di ajukan!",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content: const Icon(
                                                Icons.check_outlined,
                                                color: Color(0xff27A744),
                                                size: 26,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                      child: Container(
                                        width: 71,
                                        height: 32,
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green),
                                        child: const Text(
                                          "Ajukan",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 55),
                          child: Text(
                            "Mengajukan",
                            style: Themes.lightTheme.textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black38,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
