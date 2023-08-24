import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/themes/themes.dart';

class AssignmentCard extends StatelessWidget {
  final String title;
  final String subject;
  final String? deadline;
  final String? dateSubmit;
  final String dosen;
  final String titleDosen;
  final bool isLate;
  final bool isDone;
  final bool isGrading;
  final List arguments;
  const AssignmentCard({
    Key? key,
    required this.title,
    required this.subject,
    required this.dosen,
    this.deadline,
    this.dateSubmit,
    required this.isLate,
    required this.isDone,
    required this.isGrading,
    required this.arguments,
    required this.titleDosen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy').add_Hms();
    final date = dateFormat.parse('$deadline');

    final now = DateTime.now();
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: InkWell(
        onTap: () => Get.toNamed(
          '/studiku/assignment/detail/',
          arguments: arguments,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 35,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: isDone
                    ? const Color(0xFF3AAA35)
                    : isLate
                        ? const Color(0xFF737070)
                        : Themes.lightTheme.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  text: isDone || isGrading
                      ? 'Dikumpulkan pada:  '
                      : 'Batas pengumpulan Tugas :  ',
                  style: Themes.lightTheme.textTheme.subtitle2!
                      .copyWith(fontSize: 10, color: Colors.white),
                  children: [
                    TextSpan(
                      text: isDone || isGrading ? dateSubmit : deadline,
                      style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subject,
                    style: Themes.lightTheme.textTheme.headline5!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pertemuan $title',
                    style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: '$dosen, ',
                              style: const TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: titleDosen,
                                  style: const TextStyle(
                                    color: Color(0xFF383838),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isDone || isGrading
                              ? const Color(0xFF3AAA35)
                              : isLate
                                  ? const Color(0xFFD9D9D9)
                                  : now.isAfter(date)
                                      ? const Color(0xFFEE2D24)
                                      : const Color(0xFFFDB415),
                        ),
                        child: Text(
                          isDone
                              ? 'Selesai'
                              : isLate
                                  ? 'Terlambat'
                                  : isGrading
                                      ? 'Sedang Dinilai'
                                      : 'Lihat Tugas',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isLate || now.isBefore(date)
                                ? const Color(0xFF383838)
                                : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
