import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/verifikasi_akhir/verifikasi_akhir_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/colors_constans.dart';
import '../component/administrasi_dropdown_field.dart';
import '../component/administrasi_text_field.dart';
import '../component/label_text_field.dart';
import '../component/pick_container.dart';

class VerifikasiAkhirView extends GetView<VerifikasiAkhirController> {
  const VerifikasiAkhirView({super.key});

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
                "Verifikasi Akhir",
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
            body: Column(
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
                      percent: 90 / 100,
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
                              textEditingController: controller.emailController,
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
                            const LabelTextField(label: "No Telepon"),
                            AdministrasiTextField(
                              textEditingController: controller.phoneController,
                              textInputType: TextInputType.number,
                              hintText: "Nomor Telepon",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Masukkan No Telepon';
                                } else if (!RegExp("[0-9]").hasMatch(value)) {
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
                                suffixIcon: const Icon(Icons.calendar_month),
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
                            Row(
                              children: [
                                const LabelTextField(
                                    label: "Universitas Asal "),
                                Text(
                                  " (Kosongkan jika tidak ada)",
                                  style: Themes.lightTheme.textTheme.subtitle2!
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
                                  style: Themes.lightTheme.textTheme.subtitle2!
                                      .copyWith(
                                          fontSize: 10,
                                          color: ColorConstants.labelBlack),
                                ),
                              ],
                            ),
                            AdministrasiTextField(
                              textEditingController: controller.nsnController,
                              hintText: "NIM / NPM",
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return null;
                                } else if (!RegExp("[0-9]").hasMatch(value)) {
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
                                  style: Themes.lightTheme.textTheme.subtitle2!
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
                                } else if (!RegExp("[0-9]").hasMatch(value)) {
                                  return "Semester Berupa Angka";
                                } else if (int.parse(value) > 14) {
                                  return "Semester Tidak Dapat lebih dari 14";
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const LabelTextField(label: "Pendidikan Terakhir"),
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
                            const LabelTextField(label: "NIK"),
                            AdministrasiTextField(
                              textEditingController: controller.ninController,
                              hintText: "NIK",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Masukkan NIK';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
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
                            const LabelTextField(label: "Penghasilan Perbulan"),
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
                            const SizedBox(
                              height: 8,
                            ),
                            const LabelTextField(label: "Foto KTP"),
                            const SizedBox(height: 8),
                            PickContainer(
                              fileName: controller.ktp?.name,
                              fileNameObs: controller.ktpFileName.value,
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
                            const LabelTextField(label: "Foto Ijazah Terakhir"),
                            const SizedBox(height: 8),
                            PickContainer(
                              fileName: controller.ijazahTerbaru?.name,
                              fileNameObs: controller.ijazahFileName.value,
                              filePath: controller.ijazahTerbaru?.path,
                              onTap: () async {
                                if (controller.ijazahTerbaru?.name != null) {
                                  await controller
                                      .openFile(controller.ijazahTerbaru!.path);
                                } else {
                                  await controller.pickFile(3);
                                }
                              },
                              labelTextField: ".jpeg, .jpg, .png",
                            ),
                            const SizedBox(height: 8),
                            const LabelTextField(label: "Kartu Keluarga"),
                            const SizedBox(height: 8),
                            PickContainer(
                              fileName: controller.kk?.name,
                              fileNameObs: controller.kkFileName.value,
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
                              fileNameObs: controller.fotoFileName.value,
                              filePath: controller.pasFoto?.path,
                              onTap: () async {
                                if (controller.pasFoto?.name != null) {
                                  await controller
                                      .openFile(controller.pasFoto!.path);
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
                              fileNameObs: controller.srFileName.value,
                              filePath: controller.sRekom?.path,
                              onTap: () async {
                                if (controller.sRekom?.name != null) {
                                  await controller
                                      .openFile(controller.sRekom!.path);
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
                              fileNameObs: controller.khsFileName.value,
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
                              fileName: controller.paktaIntegritas?.name,
                              fileNameObs:
                                  controller.paktaIntegritasFileName.value,
                              filePath: controller.paktaIntegritas?.path,
                              onTap: () async {
                                if (controller.paktaIntegritas?.name != null) {
                                  await controller.openFile(
                                      controller.paktaIntegritas!.path);
                                } else {
                                  await controller.pickFile(0);
                                }
                              },
                              labelTextField: ".pdf",
                            ),
                            const SizedBox(
                              height: 8,
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
                                margin:
                                    const EdgeInsets.only(top: 41, bottom: 41),
                                height: 41,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.verification();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromWidth(200),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    backgroundColor: const Color(0xFF106FA4),
                                  ),
                                  child: Text(
                                    "Selanjutnya",
                                    style: Themes.darkTheme.textTheme.subtitle2!
                                        .copyWith(fontWeight: FontWeight.w600),
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
