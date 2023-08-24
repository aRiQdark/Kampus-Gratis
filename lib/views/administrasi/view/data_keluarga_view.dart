import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/data_keluarga/data_keluarga_controller.dart';
import 'package:kampus_gratis/views/administrasi/component/administrasi_dropdown_field.dart';
import 'package:kampus_gratis/views/administrasi/component/label_text_field.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../themes/themes.dart';
import '../component/administrasi_text_field.dart';

class DataKeluargaView extends GetView<DataKeluargaController> {
  final formKey = GlobalKey<FormState>();

  DataKeluargaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
              backgroundColor: const Color(0xFFF3F3F3),
              appBar: AppBar(
                backgroundColor: const Color(0xFF106FA4),
                toolbarHeight: 72,
                title: Text(
                  "Informasi Pekerjaan",
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
                          percent: 30 / 100,
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
                                const LabelTextField(label: "Nama Ayah"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.fatherNameController,
                                  hintText: "Nama Ayah",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Nama Ayah';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Pekerjaan Ayah"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.fatherOccupationController,
                                  hintText: "Pekerjaan Ayah",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Pekerjaan Ayah';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(
                                    label: "Penghasilan Ayah Perbulan"),
                                AdministrasiDropdownField(
                                  valueDropdown: controller.fatherIncome,
                                  items: controller.fatherIncomeItems,
                                  onChanged: (value) {
                                    controller.setDropdown(value!, 0);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Pilih Penghasilan Ayah perbulan';
                                    }
                                    return null;
                                  },
                                  hintText: "Penghasilan Ayah Perbulan",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Nama Ibu"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.motherNameController,
                                  hintText: "Nama Ibu",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Nama Ibu';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Pekerjaan Ibu"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.motherOccupationController,
                                  hintText: "Pekerjaan Ibu",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Pekerjaan Ibu';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(
                                    label: "Penghasilan Ibu Perbulan"),
                                AdministrasiDropdownField(
                                  valueDropdown: controller.motherIncome,
                                  items: controller.motherIncomeItems,
                                  onChanged: (value) {
                                    controller.setDropdown(value!, 1);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Pilih Penghasilan Ibu perbulan';
                                    }
                                    return null;
                                  },
                                  hintText: "Penghasilan Ibu Perbulan",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Tinggal Dengan"),
                                AdministrasiDropdownField(
                                  valueDropdown: controller.livingPartner,
                                  items: controller.livingPartnerItems,
                                  onChanged: (value) {
                                    controller.setDropdown(value!, 3);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Pilih Kamu Tinggal Dengan Siapa';
                                    }
                                    return null;
                                  },
                                  hintText: "Tinggal Dengan",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Pekerjaan Kamu"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.occupationController,
                                  hintText: "Pekerjaan Sendiri",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Pekerjaan Sendiri';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(
                                    label: "Penghasilan Perbulan"),
                                AdministrasiDropdownField(
                                  valueDropdown: controller.income,
                                  items: controller.incomeItems,
                                  onChanged: (value) {
                                    controller.setDropdown(value!, 2);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Pilih Penghasilan perbulan';
                                    }
                                    return null;
                                  },
                                  hintText: "Penghasilan Perbulan",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(
                                    label: "Biaya Kuliah Ditanggung Oleh"),
                                AdministrasiDropdownField(
                                    valueDropdown: controller.financier,
                                    items: const [
                                      'Diri Sendiri',
                                      'Orang Tua',
                                      'Wali',
                                      'Beasiswa',
                                    ],
                                    onChanged: (value) {
                                      controller.setDropdown(value!, 4);
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your Biaya Kuliah Ditanggung';
                                      }
                                      return null;
                                    },
                                    hintText: "Biaya Kuliah Ditanggung Oleh"),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    height: 41,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          controller.putFamilial();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size.fromWidth(200),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF106FA4),
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
              )),
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
