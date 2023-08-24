import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/silabus/kontrak_krs_controller.dart';

class BoxMatakuliah extends GetView<KontrakKrsController> {
  const BoxMatakuliah(
      {Key? key,
      required this.kode,
      required this.jmlSks,
      required this.jenisMatkul,
      required this.nmMatkul,
      required this.jmlmhs,
      required this.level,
      required this.subjectId,
      this.semester,
      this.name,
      this.major,
      this.lecturer})
      : super(key: key);

  final String kode;
  final int jmlSks;
  final String jenisMatkul;
  final String nmMatkul;
  final int jmlmhs;
  final String level;
  final String subjectId;
  final int? semester;
  final String? name;
  final String? major;
  final String? lecturer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 136,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$kode - $jmlSks SKS - $jenisMatkul",
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      nmMatkul,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              radius: 25,
                              backgroundColor: Colors.white,
                              title: 'Konfirmasi',
                              titleStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              middleText:
                                  'Apakah matakuliah sudah pernah diambil?',
                              middleTextStyle:
                                  const TextStyle(color: Colors.black),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.toNamed('/file', arguments: [
                                      semester,
                                      name,
                                      major,
                                      lecturer,
                                      subjectId
                                    ]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Text(
                                    'Sudah\n diambil',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  width: 46,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.back();
                                    await controller.postDraftKrs(
                                        subjectId, context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  child: const Text(
                                    'Belum\n diambil',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ]);
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$jmlmhs Mahasiswa',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Container(
                    height: 22,
                    width: 102,
                    decoration: BoxDecoration(
                      color: const Color(0XFF91bff5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        level,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 4,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            color: Color(0xff9D71E8),
          ),
        ),
      ]),
    );
  }
}
