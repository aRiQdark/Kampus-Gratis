import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/jenjang_pendidikan/jenjang_pendidikan_controller.dart';
import 'package:kampus_gratis/views/administrasi/component/administrasi_dropdown_field.dart';
import 'package:kampus_gratis/views/administrasi/component/label_text_field.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../themes/themes.dart';

class JenjangPendidikanView extends GetView<JenjangPendidikanController> {
  const JenjangPendidikanView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: const Color(0xFFF3F3F3),
            appBar: AppBar(
              backgroundColor: const Color(0xFF106FA4),
              toolbarHeight: 72,
              title: Text(
                "Jenjang Pendidikan",
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
                    color: const Color(0xFFF3F3F3),
                    child: Center(
                      child: LinearPercentIndicator(
                        backgroundColor: const Color(0xFFD9D9D9),
                        animation: true,
                        lineHeight: 11,
                        animateFromLastPercent: true,
                        animationDuration: 1000,
                        percent: 80 / 100,
                        barRadius: const Radius.circular(8),
                        progressColor: const Color(0xFF3AAA35),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const LabelTextField(label: "Jenjang Pendidikan"),
                              AdministrasiDropdownField(
                                  valueDropdown: controller.jenjangPendidikan,
                                  items: const [
                                    'D1',
                                    'D2',
                                    'D3',
                                    'S1',
                                  ],
                                  onChanged: (value) {
                                    controller.setJP(value!);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Jenjang Pendidikan Belum Dipilih';
                                    }
                                    return null;
                                  },
                                  hintText: "Jenjang Pendidikan"),
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 41),
                                  height: 41,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        controller.putDegree();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size.fromWidth(200),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      backgroundColor: const Color(0xFF106FA4),
                                    ),
                                    child: Text(
                                      "Selanjutnya",
                                      style: Themes
                                          .darkTheme.textTheme.subtitle2!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onError: (error) {
                return Center(
                  child: Text(error.toString()),
                );
              },
            ),
          ),
          controller.isLoading.value
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black38,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
