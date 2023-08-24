import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/silabus_controller.dart';
import 'package:kampus_gratis/views/rencana_study/components/data_text.dart';

class DataContainer extends GetView<SilabusController> {
  const DataContainer(
      {this.nama, this.jurusan, this.semester, this.dp, super.key});
  final String? nama;
  final String? jurusan;
  final int? semester;
  final String? dp;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff0E69D3),
          boxShadow: const [
            BoxShadow(
                color: Color(0XFF8f8f8f), offset: Offset(0, 2), blurRadius: 2)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataText(name: 'Nama', value: nama!),
          const SizedBox(
            height: 10,
          ),
          DataText(name: 'Jurusan', value: jurusan!),
          const SizedBox(
            height: 10,
          ),
          DataText(name: 'Semester', value: '$semester'),
          const SizedBox(
            height: 10,
          ),
          DataText(name: 'Dosen Pembimbing', value: dp!),
        ],
      ),
    );
  }
}
