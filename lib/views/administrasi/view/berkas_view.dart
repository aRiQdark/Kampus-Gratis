import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kampus_gratis/controllers/administrasi/berkas/berkas_controller.dart';
import 'package:kampus_gratis/views/administrasi/component/label_text_field.dart';
import 'package:kampus_gratis/views/administrasi/component/pick_container.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../themes/themes.dart';

class BerkasView extends GetView<BerkasController> {
  const BerkasView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Obx(() => Stack(
          children: <Widget>[
            Scaffold(
                backgroundColor: const Color(0xFFF3F3F3),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF106FA4),
                  toolbarHeight: 72,
                  title: Text(
                    "Informasi Berkas",
                    style: Themes.darkTheme.textTheme.subtitle1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                  ),
                ),
                body: controller.obx(
                  (state) => Column(
                    children: [
                      Container(
                        height: 54,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFFD9D9D9),
                            animation: true,
                            lineHeight: 11,
                            animateFromLastPercent: true,
                            animationDuration: 1000,
                            percent: 60 / 100,
                            barRadius: const Radius.circular(8),
                            progressColor: const Color(0xFF3AAA35),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GetBuilder<BerkasController>(
                          builder: (_) {
                            return SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const LabelTextField(label: "Foto KTP"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName: controller.ktp?.name,
                                        fileNameObs:
                                            controller.ktpFileName.value,
                                        filePath: controller.ktp?.path,
                                        onTap: () async {
                                          if (controller.ktp?.name != null) {
                                            await controller
                                                .openFile(controller.ktp!.path);
                                          } else {
                                            await controller.pickFile(1);
                                          }
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Foto Ijazah Terakhir"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName:
                                            controller.ijazahTerbaru?.name,
                                        fileNameObs:
                                            controller.ijazahFileName.value,
                                        filePath:
                                            controller.ijazahTerbaru?.path,
                                        onTap: () async {
                                          if (controller.ijazahTerbaru?.name !=
                                              null) {
                                            await controller.openFile(
                                                controller.ijazahTerbaru!.path);
                                          } else {
                                            await controller.pickFile(3);
                                          }
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Kartu Keluarga"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName: controller.kk?.name,
                                        fileNameObs:
                                            controller.kkFileName.value,
                                        filePath: controller.kk?.path,
                                        onTap: () async {
                                          if (controller.kk?.name != null) {
                                            await controller
                                                .openFile(controller.kk!.path);
                                          } else {
                                            await controller.pickFile(2);
                                          }
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(label: "Pas Foto"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName: controller.pasFoto?.name,
                                        fileNameObs:
                                            controller.fotoFileName.value,
                                        filePath: controller.pasFoto?.path,
                                        onTap: () async {
                                          if (controller.pasFoto?.name !=
                                              null) {
                                            await controller.openFile(
                                                controller.pasFoto!.path);
                                          } else {
                                            await controller.pickFile(4);
                                          }
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Sertifikat yang dimiliki"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName: controller.sRekom?.name,
                                        fileNameObs:
                                            controller.srFileName.value,
                                        filePath: controller.sRekom?.path,
                                        onTap: () async {
                                          if (controller.sRekom?.name != null) {
                                            await controller.openFile(
                                                controller.sRekom!.path);
                                          } else {
                                            await controller.pickFile(6);
                                          }
                                        },
                                        labelTextField: ".pdf",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Transkip Nilai Terbaru"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName: controller.khs?.name,
                                        fileNameObs:
                                            controller.khsFileName.value,
                                        filePath: controller.khs?.path,
                                        onTap: () async {
                                          if (controller.khs?.name != null) {
                                            await controller
                                                .openFile(controller.khs!.path);
                                          } else {
                                            await controller.pickFile(5);
                                          }
                                        },
                                        labelTextField: ".pdf",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Surat Pernyataan Orang Tua"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        fileName:
                                            controller.paktaIntegritas?.name,
                                        fileNameObs: controller
                                            .paktaIntegritasFileName.value,
                                        filePath:
                                            controller.paktaIntegritas?.path,
                                        onTap: () async {
                                          if (controller
                                                  .paktaIntegritas?.name !=
                                              null) {
                                            await controller.openFile(controller
                                                .paktaIntegritas!.path);
                                          } else {
                                            await controller.pickFile(0);
                                          }
                                        },
                                        labelTextField: ".pdf",
                                      ),
                                      Center(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 41),
                                          height: 41,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (state?.files?.integrityPact !=
                                                      null &&
                                                  state?.files?.ninCard !=
                                                      null &&
                                                  state?.files?.familyCard !=
                                                      null &&
                                                  state?.files?.certificate !=
                                                      null &&
                                                  state?.files?.photo != null) {
                                                controller.putFiles();
                                              } else if (controller
                                                          .paktaIntegritas !=
                                                      null &&
                                                  controller.ktp != null &&
                                                  controller.kk != null &&
                                                  controller.ijazahTerbaru !=
                                                      null &&
                                                  controller.pasFoto != null) {
                                                controller.putFiles();
                                              } else {
                                                Get.defaultDialog(
                                                    middleText:
                                                        'Berkas tidak boleh kosong');
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize:
                                                  const Size.fromWidth(200),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFF106FA4),
                                            ),
                                            child: Text(
                                              "Selanjutnya",
                                              style: Themes.darkTheme.textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            controller.isLoading.value
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.black38,
                  )
                : const SizedBox()
          ],
        ));
  }
}
