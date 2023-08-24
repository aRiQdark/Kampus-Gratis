import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/studiku/modul_controller.dart';

class ModulDetailView extends GetView<ModulController> {
  const ModulDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getDetailModuleById(Get.arguments[2]);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: const Color(0xff106FA4),
              leading: IconButton(
                onPressed: () async {
                  Get.back();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Modul ${Get.arguments[0]}',
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [Image.asset('assets/images/LOGO-01.png')],
            ),
          ),
          body: Obx(
            () {
              if (controller.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                padding: const EdgeInsets.only(bottom: 16),
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Panduan",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Pada modul kali ini kita akan mempelajari basic dari ${Get.arguments[1]} diharapkan mahasiswa mampu mempelajari dengan baik, Berikut beberapa modul yang diberikan yaitu berupa modul Video dan Modul Pdf yang bisa kamu download",
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Modul Video",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.detailModul.value != null
                                  ? controller.detailModul.value!.videos.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final String? thumbnail =
                                    controller.getYoutubeThumbnail(controller
                                        .detailModul.value!.videos[index].url);
                                return SizedBox(
                                  width: 214,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            '/studiku/module_video',
                                            arguments: [
                                              controller.detailModul.value
                                                  ?.videos[index].title,
                                              controller.detailModul.value
                                                  ?.videos[index].description,
                                              controller.detailModul.value
                                                  ?.videos[index].url,
                                            ],
                                          );
                                        },
                                        child: Image(
                                          width: 214,
                                          height: 100,
                                          image: NetworkImage(thumbnail ?? ''),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.detailModul.value!
                                              .videos[index].title,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 16,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Modul Pdf",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                controller.detailModul.value?.documents.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: controller.randomColor(),
                                      borderRadius: BorderRadius.circular(360)),
                                  child:
                                      Image.asset('assets/icons/file-text.png'),
                                ),
                                title: Text(
                                    "${controller.detailModul.value?.documents[index].content}"),
                                trailing: GestureDetector(
                                  onTap: () async {
                                    Get.snackbar(
                                      'Sedang Download',
                                      'Mohon Tunggu',
                                    );
                                    await controller.downloadDocument(controller
                                        .detailModul
                                        .value!
                                        .documents[index]
                                        .link);
                                  },
                                  child: Image.asset(
                                    'assets/icons/download_hijau.png',
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                              radius: 20,
                              backgroundColor: Colors.white,
                              title: '',
                              content: Column(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/peringatan_merah.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Sudah membaca modul?",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          "Apakah kamu sudah benar-benar membaca atau menonton semua modul?",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            backgroundColor:
                                                const Color(0xffE5E5E5),
                                          ),
                                          onPressed: () {},
                                          child: const Text("Belum")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            backgroundColor:
                                                const Color(0xff106FA4),
                                          ),
                                          onPressed: () {},
                                          child: const Text("Sudah")),
                                    ],
                                  )
                                ],
                              ));
                        },
                        child: const Text("Selesai")),
                  ),
                ],
              );
            },
          )),
    );
  }
}
