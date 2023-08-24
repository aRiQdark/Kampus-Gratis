import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/assignment_controller.dart';
import 'package:kampus_gratis/extensions/thumbnail.dart';
import 'package:kampus_gratis/views/studiku/components/detail_lampiran.dart';

class CardLampiran extends GetView<AssignmentController> {
  final String assignmentFile;
  final String name;
  const CardLampiran({
    super.key,
    required this.assignmentFile,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: ((context) {
          return const DetailLampiran();
        }),
      ),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  thumbnail(assignmentFile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
