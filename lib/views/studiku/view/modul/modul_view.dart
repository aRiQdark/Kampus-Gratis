import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/modul_controller.dart';
import 'package:kampus_gratis/controllers/studiku/session_controller.dart';

class ModulView extends GetView<ModulController> {
  const ModulView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xff106FA4),
          leading: IconButton(
            onPressed: () {
              final SessionStudikuController c = Get.find();
              c.getAllSessionByid(Get.arguments[2]);
              Get.back();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Pertemuan ${Get.arguments[1]}',
            style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [Image.asset('assets/images/LOGO-01.png')],
        ),
      ),
      body: SingleChildScrollView(
          child: controller.obx(
        (state) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.allDataModuleByIdSession.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.black,
                  color: const Color(0xffE9F3FF),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/studiku/modul_detail', arguments: [
                        index + 1,
                        controller.allDataModuleByIdSession[index].description,
                        controller.allDataModuleByIdSession[index].id,
                        controller.allDataModuleByIdSession[index].status
                      ]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Modul ${index + 1}',
                                  style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      controller.allDataModuleByIdSession[index]
                                          .description,
                                      maxLines: 4,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      ' Video ${controller.allDataModuleByIdSession[index].contentLength.numberOfVideo}',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ' Dokumen ${controller.allDataModuleByIdSession[index].contentLength.numberOfDocument}',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (controller
                                  .allDataModuleByIdSession[index].status !=
                              "NOT ENROLLED") ...{
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.check_circle_outlined,
                                size: 18,
                                color: Color(0xff24CE09),
                              ),
                            ),
                          }
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
