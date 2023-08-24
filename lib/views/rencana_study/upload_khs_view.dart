import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/views/rencana_study/components/data_text.dart';
import '../../controllers/silabus/upload_khs_controller.dart';
import '../../widgets/app_bar.dart';

class UploadKhsView extends GetView<UploadKhsController> {
  UploadKhsView({super.key});

  final String subjectId = Get.arguments[4];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: const KGAppBar(
            backButton: true,
            title: 'Lampiran KHS',
            withIconKG: true,
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff0E69D3),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0XFF8f8f8f),
                              offset: Offset(0, 2),
                              blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DataText(
                            name: 'Nama',
                            value: '${Get.arguments[1]}'.toUpperCase()),
                        const SizedBox(
                          height: 10,
                        ),
                        DataText(
                            name: 'Jurusan',
                            value: '${Get.arguments[2]}'.toUpperCase()),
                        const SizedBox(
                          height: 10,
                        ),
                        DataText(
                            name: 'Semester',
                            value: '${Get.arguments[0]}'.toUpperCase()),
                        const SizedBox(
                          height: 10,
                        ),
                        DataText(
                            name: 'Dosen Pembimbing',
                            value: '${Get.arguments[3]}'.toUpperCase()),
                      ],
                    ),
                  )
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.15,
                minChildSize: 0.15,
                maxChildSize: 0.6,
                builder: ((context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0XFFb4d6ff),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Center(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.keyboard_double_arrow_up,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'LAMPIRAN BUKTI',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Lampiran',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            Obx(() => SizedBox(
                                  child: controller.isEmpty.value
                                      ? Container(
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 24),
                                          child: const Text(
                                            'Anda belum mengupload lampiran',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 24),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color(0XFFebeaea),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(Icons.file_present),
                                              SizedBox(
                                                width: Get.width * 0.6,
                                                child: Text(
                                                  controller.fileName.value,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  controller.deleteFile();
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ],
                                          ),
                                        ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: controller.isEmpty.value
                                      ? () {
                                          controller.pickFile();
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0XFFd6e8ff),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ambil berkas',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() => SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: controller.isEmpty.value
                                        ? null
                                        : () {
                                            controller.postKhs(
                                                subjectId, context);
                                            controller.deleteFile();
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0XFFd6e8ff),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: const Text(
                                      'Upload',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
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
        )
      ],
    );
  }
}
