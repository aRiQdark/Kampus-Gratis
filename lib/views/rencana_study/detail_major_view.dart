import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/controllers/silabus/detail_jurusan_controller.dart';
import 'package:kampus_gratis/controllers/silabus/draft_krs_controller.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:get/get.dart';

import '../../services/providers/silabus/silabus_view_provider.dart';
import '../../themes/themes.dart';
import 'dart:math' as math;

class DetailMajorView extends GetView<DetailJurusanController> {
  const DetailMajorView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DraftKrsController(Get.find<SilabusViewProvider>()));
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
                  margin: const EdgeInsets.only(bottom: 24),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Get.arguments[1],
                        style: Themes.lightTheme.textTheme.bodyText1!
                            .copyWith(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        state?.major?.description ?? 'Tidak ada deskripsi',
                        style: Themes.lightTheme.textTheme.caption!.copyWith(
                          color: const Color(0XFF383838),
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                                text: '${Get.arguments[1]}',
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
                                text:
                                    '${state?.studentsInformation?.semester ?? '0'}',
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
                            text: 'Jumlah Matakuliah : ',
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
                        height: 10,
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.result?.length ?? 0,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return const SizedBox();
                      }
                      return ExpansionWidget(
                        initiallyExpanded: false,
                        titleBuilder: (animationValue, easeInValue, isExpanded,
                            toggleFunction) {
                          if (controller.isExpanded[index] == true) {
                            return InkWell(
                              onTap: () {
                                toggleFunction(animated: true);
                                controller.changeExpanded(index);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 17),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0XFF3AAA35),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    toggleFunction(animated: true);
                                    controller.changeExpanded(index);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Mata Kuliah yang tersedia',
                                          style: Themes
                                              .lightTheme.textTheme.button,
                                        ),
                                      ),
                                      Transform.rotate(
                                        angle: math.pi * animationValue / 2,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: state?.result?[index].semester !=
                                    state?.studentsInformation?.semester
                                ? null
                                : () {
                                    toggleFunction(animated: true);
                                    controller.changeExpanded(index);
                                  },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 17),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: state?.result?[index].semester !=
                                        state?.studentsInformation?.semester
                                    ? const Color(0XFF939094)
                                    : const Color(0XFF106fa4),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                    state?.result?[index].semester !=
                                            state?.studentsInformation?.semester
                                        ? 'Terkunci'
                                        : 'Semester ${state?.result?[index].semester}',
                                    style: Themes.lightTheme.textTheme.button,
                                  )),
                                  Transform.rotate(
                                    angle: math.pi * animationValue / 2,
                                    alignment: Alignment.center,
                                    child: state?.result?[index].semester !=
                                            state?.studentsInformation?.semester
                                        ? const Icon(
                                            Icons.lock,
                                            size: 15,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        content: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state!.result![index].subjects!.length,
                            itemBuilder: (context, indexed) {
                              return Container(
                                margin: EdgeInsets.only(
                                    bottom: 13, top: index == 0 ? 13 : 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFFFFBFE),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kode Matkul',
                                      style: Themes
                                          .lightTheme.textTheme.overline!
                                          .copyWith(color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        '${state.result![index].subjects![indexed].subject!.name}',
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
                                          '${state.major?.lecturer?.user?.fullName}',
                                          style: Themes
                                              .lightTheme.textTheme.overline!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF383838),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: const Color(0XFF3AAA35),
                                          ),
                                          child: Text(
                                            '${state.result?[index].subjects?[indexed].subject?.level}',
                                            style: Themes
                                                .lightTheme.textTheme.overline!
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 27,
                ),
                Center(
                  child: GestureDetector(
                    onTap: controller.isLoading.value
                        ? null
                        : () {
                            showDialog(
                              context: Get.context!,
                              builder: (ctx) => Center(
                                child: Container(
                                  width: Get.width * 0.8,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/icons/exclamation_sign.png'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Ingin memilih ini?',
                                        textAlign: TextAlign.center,
                                        style: Themes
                                            .lightTheme.textTheme.headline6!
                                            .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0XFF1C1B1F),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'Kamu hanya bisa memilih satu Program Studi',
                                        maxLines: 4,
                                        textAlign: TextAlign.center,
                                        style: Themes
                                            .lightTheme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 12,
                                                color: const Color(0XFF1C1B1F)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0XFFe5e5e5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                            child: Text(
                                              'Nanti',
                                              style: Themes
                                                  .lightTheme.textTheme.button!
                                                  .copyWith(
                                                      color: const Color(
                                                          0XFF383838)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 18,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                              controller.postMajor(
                                                  Get.arguments[0], context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0XFF106fa4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                            child: Text('Pilih',
                                                style: Themes.lightTheme
                                                    .textTheme.button),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0XFF3aaa35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mengajukan',
                            style: Themes.lightTheme.textTheme.button,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                )
              ],
            ),
            onEmpty: const Center(
              child: Text('Tidak Ada Data!'),
            ),
            onError: (error) => Center(
              child: Text(
                error.toString(),
              ),
            ),
          ),
        ),
        Obx(
          () => controller.isWaiting.value
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
