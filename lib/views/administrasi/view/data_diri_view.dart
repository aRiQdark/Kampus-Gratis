import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/data_diri/data_diri_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/administrasi/component/administrasi_dropdown_field.dart';
import 'package:kampus_gratis/views/administrasi/component/administrasi_text_field.dart';
import 'package:kampus_gratis/views/administrasi/component/label_text_field.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/colors_constans.dart';

class DataDiriView extends GetView<DataDiriController> {
  DataDiriView({super.key});
  final formKey = GlobalKey<FormState>();

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
                "Informasi Pribadi",
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
              (_) {
                return Column(
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
                          percent: 0 / 100,
                          barRadius: const Radius.circular(8),
                          progressColor: const Color(0xFF3AAA35),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                const LabelTextField(
                                  label: "Nama",
                                ),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.fullNameController,
                                  hintText: "Nama Lengkap",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Nama';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Email"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.emailController,
                                  hintText: "Email",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan email';
                                    } else if (!RegExp(
                                            "^[a-zA-Z0-9_.-]+@[a-zA-Z]+[.]+[a-z]")
                                        .hasMatch(value)) {
                                      return 'Masukkan Email yang valid';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "NIK"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.ninController,
                                  hintText: "NIK",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan NIK';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "No Telepon"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.phoneController,
                                  textInputType: TextInputType.number,
                                  hintText: "Nomor Telepon",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan No Telepon';
                                    } else if (!RegExp("[0-9]")
                                        .hasMatch(value)) {
                                      return "Nomor Telepon Berupa Angka";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Tanggal Lahir"),
                                Obx(
                                  () => AdministrasiTextField(
                                    textEditingController:
                                        controller.birthDateController.value,
                                    hintText: "Tanggal Lahir",
                                    onTap: () => controller.datePicker(context),
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Masukkan Tanggal Lahir';
                                      }
                                      return null;
                                    },
                                    suffixIcon:
                                        const Icon(Icons.calendar_month),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Tempat Lahir"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.birthPlaceController,
                                  hintText: "Tempat Lahir",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Tempat Lahir';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Alamat"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.residenceAddressController,
                                  hintText: "Alamat",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Alamat';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Jenis Kelamin"),
                                AdministrasiDropdownField(
                                  valueDropdown: controller.selectedGender,
                                  items: controller.items,
                                  onChanged: (value) {
                                    controller.setGender(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Jenis Kelamin Belum Dipilih';
                                    }
                                    return null;
                                  },
                                  hintText: "Jenis Kelamin",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(
                                    label: "Pendidikan Terakhir"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.ninAddressController,
                                  hintText: "Pendidikan Terakhir",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Pendidikan Terakhir';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const LabelTextField(label: "Program Study"),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.studyProgramController,
                                  hintText: "Program Study",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Program Study';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const LabelTextField(
                                        label: "Universitas Asal "),
                                    Text(
                                      " (Kosongkan jika tidak ada)",
                                      style: Themes
                                          .lightTheme.textTheme.subtitle2!
                                          .copyWith(
                                              fontSize: 10,
                                              color: ColorConstants.labelBlack),
                                    ),
                                  ],
                                ),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.universityOfOriginController,
                                  hintText: "Universitas Asal",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const LabelTextField(label: "NIM / NPM"),
                                    Text(
                                      " (Kosongkan jika tidak ada)",
                                      style: Themes
                                          .lightTheme.textTheme.subtitle2!
                                          .copyWith(
                                              fontSize: 10,
                                              color: ColorConstants.labelBlack),
                                    ),
                                  ],
                                ),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.nsnController,
                                  hintText: "NIM / NPM",
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    } else if (!RegExp("[0-9]")
                                        .hasMatch(value)) {
                                      return "NIM / NPM Berupa Angka";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const LabelTextField(
                                        label: "Semester Sekarang "),
                                    Text(
                                      " (Kosongkan jika tidak ada)",
                                      style: Themes
                                          .lightTheme.textTheme.subtitle2!
                                          .copyWith(
                                              fontSize: 10,
                                              color: ColorConstants.labelBlack),
                                    ),
                                  ],
                                ),
                                AdministrasiTextField(
                                  textEditingController:
                                      controller.semesterController,
                                  hintText: "Semester",
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    } else if (!RegExp("[0-9]")
                                        .hasMatch(value)) {
                                      return "Semester Berupa Angka";
                                    } else if (int.parse(value) > 14) {
                                      return "Semester Tidak Dapat lebih dari 14";
                                    }

                                    return null;
                                  },
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    height: 41,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          controller.putBiodata();
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
                );
              },
              onError: (error) => Center(
                child: Text(error.toString()),
              ),
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
