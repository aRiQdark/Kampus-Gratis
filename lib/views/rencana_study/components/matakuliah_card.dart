import 'package:flutter/material.dart';
import 'package:kampus_gratis/controllers/silabus/silabus_controller.dart';
import 'package:get/get.dart';

class MatakuliahCard extends GetView<SilabusController> {
  const MatakuliahCard(
      {super.key,
      required this.subjectCode,
      required this.credit,
      required this.subjectType,
      required this.name,
      required this.studentCount,
      required this.level});

  Color labelColor(String label) {
    if (label == 'Basic') {
      return const Color(0xff4895ef).withOpacity(0.6);
    } else if (label == 'Advanced') {
      return const Color(0xff4361ee).withOpacity(0.6);
    } else {
      return const Color(0xff3f37c9).withOpacity(0.6);
    }
  }

  final String subjectCode;
  final int credit;
  final String subjectType;
  final String name;
  final int studentCount;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 138,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 2),
                  blurRadius: 1,
                  spreadRadius: 2,
                  color: Color(0xffc6c6c6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$subjectCode - $credit SKS - $subjectType',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff696969),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$studentCount Mahasiswa',
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    Container(
                      height: 22,
                      width: 102,
                      decoration: BoxDecoration(
                        color: labelColor(level),
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
            decoration: const BoxDecoration(
              color: Color(0xff8EC1FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 14, bottom: 6),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children:
    //   ),
    // );
  }
}
