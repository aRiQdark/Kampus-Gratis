import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/kontrak_krs_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';

import '../../widgets/app_bar.dart';

class KontrakKrsView extends GetView<KontrakKrsController> {
  const KontrakKrsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0XFFf3f3f3),
          appBar: const KGAppBar(
            backButton: true,
            title: 'Program Studi',
            withIconKG: true,
          ),
          body: controller.obx(
            (state) => ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
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
                                text:
                                    '${controller.detailJurusanModel?.major?.name}',
                                style: Themes.lightTheme.textTheme.subtitle2!
                                    .copyWith(fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Semester : ',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${state?.semester}',
                                style: Themes.lightTheme.textTheme.subtitle2!
                                    .copyWith(fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Jumlah Matakuliah Semester ini : ',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${state?.subjects?.length}',
                                style: Themes.lightTheme.textTheme.subtitle2!
                                    .copyWith(fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Kepala Prodi : ',
                            style: Themes.lightTheme.textTheme.subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${controller.detailJurusanModel?.major?.lecturer?.user?.fullName}',
                                style: Themes.lightTheme.textTheme.subtitle2!
                                    .copyWith(fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(
                            '/draft-krs',
                            arguments: [
                              controller.detailJurusanModel?.major?.name ?? '',
                              state?.semester ?? '',
                              state?.subjects?.length ?? 0,
                              controller.detailJurusanModel?.major?.lecturer
                                      ?.user?.fullName ??
                                  ''
                            ],
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color(0XFF3AAA35),
                        ),
                        child: Text(
                          'Draft',
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color(0XFF3AAA35),
                        ),
                        child: Text(
                          'Pre Test',
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(
                            '/pengajuan-berkas',
                            arguments: [
                              controller.detailJurusanModel?.major?.name ?? '',
                              state?.semester ?? '',
                              state?.subjects?.length ?? 0,
                              controller.detailJurusanModel?.major?.lecturer
                                      ?.user?.fullName ??
                                  ''
                            ],
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color(0XFF3AAA35),
                        ),
                        child: Text(
                          'Pengajuan Berkas',
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: state?.subjects?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('detail-matakuliah', arguments: [
                          state?.subjects?[index].subject?.name,
                          state?.semester,
                          state?.subjects?[index].lecturers?[0].user?.fullName
                        ]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Kode Matakuliah',
                                        style: Themes
                                            .lightTheme.textTheme.overline!
                                            .copyWith(
                                          color: const Color(0XFF383838),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: Get.context!,
                                            builder: (ctx) => Center(
                                              child: Container(
                                                width: Get.width * 0.8,
                                                padding:
                                                    const EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/icons/confirm_sign.png'),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      'Konfirmasi',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Themes.lightTheme
                                                          .textTheme.headline6!
                                                          .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0XFF1C1B1F),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      'Sudah pernah mengambil mata kuliah ini?',
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Themes.lightTheme
                                                          .textTheme.caption!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: const Color(
                                                                  0XFF1C1B1F)),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            Get.toNamed('/file',
                                                                arguments: [
                                                                  controller
                                                                      .detailJurusanModel
                                                                      ?.studentsInformation
                                                                      ?.semester,
                                                                  state
                                                                      ?.subjects?[
                                                                          index]
                                                                      .subject
                                                                      ?.name,
                                                                  controller
                                                                      .detailJurusanModel
                                                                      ?.major
                                                                      ?.name,
                                                                  state
                                                                      ?.subjects?[
                                                                          index]
                                                                      .lecturers?[
                                                                          0]
                                                                      .user
                                                                      ?.fullName,
                                                                  state
                                                                      ?.subjects?[
                                                                          index]
                                                                      .subject
                                                                      ?.id
                                                                ]);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0XFFe5e5e5),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Sudah',
                                                            style: Themes
                                                                .lightTheme
                                                                .textTheme
                                                                .button!
                                                                .copyWith(
                                                                    color: const Color(
                                                                        0XFF383838)),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 18,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            Get.back();
                                                            await controller
                                                                .postDraftKrs(
                                                                    '${state?.subjects?[index].subject?.id}',
                                                                    context);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0XFF106fa4),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Text('Belum',
                                                              style: Themes
                                                                  .lightTheme
                                                                  .textTheme
                                                                  .button),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.black,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      '${state?.subjects?[index].subject?.name}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Themes
                                          .lightTheme.textTheme.subtitle1!
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${state?.subjects?[index].lecturers?[0].user?.fullName}',
                                        style: Themes
                                            .lightTheme.textTheme.overline!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF383838),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 4),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0XFFFDB415),
                                            ),
                                            child: Text(
                                              '${state?.subjects?[index].subject?.credit} SKS',
                                              style: Themes.lightTheme.textTheme
                                                  .overline!
                                                  .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0XFFEE2D24),
                                            ),
                                            child: Text(
                                              'Wajib',
                                              style: Themes.lightTheme.textTheme
                                                  .overline!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 36,
                              decoration: const BoxDecoration(
                                color: Color(0XFF106FA4),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
