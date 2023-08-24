import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/kontrak_krs_controller.dart';

import 'dart:math' as math;
import 'box_matakuliah.dart';

class CustomDropdownExample extends GetView<KontrakKrsController> {
  const CustomDropdownExample(
      {Key? key,
      required this.text,
      required this.index,
      this.semester,
      this.name,
      this.major,
      this.lecturer})
      : super(key: key);
  final int? semester;
  final String? name;
  final String? major;
  final String? lecturer;
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionWidget(
          initiallyExpanded: false,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            if (controller.isExpanded[index] == true) {
              return Container(
                width: double.infinity,
                height: 62,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color(0xff4895EF),
                ),
                child: InkWell(
                  onTap: () {
                    toogleFunction(animated: true);
                    controller.changeExpanded(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Transform.rotate(
                          angle: math.pi * animationValue / 2,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.arrow_forward_ios,
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
            return Container(
              width: double.infinity,
              height: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff4895EF),
              ),
              child: InkWell(
                onTap: () {
                  toogleFunction(animated: true);
                  controller.changeExpanded(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          content: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
              decoration: const BoxDecoration(
                color: Color(0xffe0e0ff),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: SizedBox(
                height: controller.result![index].subjects!.length * 150,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.result![index].subjects!.length,
                  itemBuilder: (context, indexed) {
                    return BoxMatakuliah(
                      semester: semester,
                      name: name,
                      major: major,
                      lecturer: lecturer,
                      kode: 'TIK304',
                      jmlSks: controller.result?[index].subjects?[indexed]
                              .subject?.credit ??
                          0,
                      jenisMatkul: 'Bebas',
                      nmMatkul:
                          '${controller.result?[index].subjects?[indexed].subject?.name}',
                      jmlmhs: controller
                              .result?[index].subjects?[indexed].studentCount ??
                          0,
                      level: controller.result?[index].subjects?[indexed]
                              .subject?.level ??
                          'null',
                      subjectId: controller
                          .result![index].subjects![indexed].subject!.id!,
                    );
                  },
                ),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
