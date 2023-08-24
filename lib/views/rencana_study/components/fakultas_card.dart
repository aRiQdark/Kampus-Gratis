import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/silabus/detail_jurusan_controller.dart';
import '../../../themes/themes.dart';

class FakultasCard extends GetView<DetailJurusanController> {
  const FakultasCard(
      {super.key,
      required this.name,
      required this.description,
      required this.lecturerName,
      required this.numberOfSubjects,
      required this.thumbnailLink});

  final String name;
  final String description;
  final String lecturerName;
  final String numberOfSubjects;
  final String thumbnailLink;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                color: Color(0XFFd4d4d4),
                blurRadius: 1,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 118,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                thumbnailLink,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      name[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0XFF2a93b0),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                name,
                style: Themes.lightTheme.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "4 Program Studi tersedia",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Themes.lightTheme.textTheme.overline!
                    .copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    color: const Color(0XFF3AAA35),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$numberOfSubjects SKS',
                    style: Themes.lightTheme.textTheme.overline!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    color: const Color(0XFF106fa4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$numberOfSubjects Mata Kuliah',
                    style: Themes.lightTheme.textTheme.overline!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        )
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         margin: const EdgeInsets.only(right: 10),
        //         height: 102,
        //         child: Image.network(
        //           thumbnailLink,
        //           fit: BoxFit.cover,

        //         ),
        //         // decoration: BoxDecoration(
        //         //   image: DecorationImage(
        //         //       image: NetworkImage(thumbnailLink), fit: BoxFit.cover),
        //         // ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 2,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             name,
        //             maxLines: 1,
        //             overflow: TextOverflow.ellipsis,
        //             style: const TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black),
        //           ),
        //           Text(
        //             description,
        //             maxLines: 3,
        //             overflow: TextOverflow.ellipsis,
        //             style: const TextStyle(
        //               color: Colors.black,
        //               fontSize: 11,
        //             ),
        //             textAlign: TextAlign.justify,
        //           ),
        //           Row(
        //             children: [
        //               Row(
        //                 children: [
        //                   Container(
        //                     width: 12,
        //                     height: 12,
        //                     decoration: const BoxDecoration(
        //                       image: DecorationImage(
        //                           image:
        //                               AssetImage('assets/icons/icon_class.png'),
        //                           fit: BoxFit.cover),
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     width: 5,
        //                   ),
        //                   Text(
        //                     '$numberOfSubjects Mata Kuliah',
        //                     maxLines: 1,
        //                     overflow: TextOverflow.ellipsis,
        //                     style:
        //                         const TextStyle(fontSize: 9, color: Colors.black),
        //                   )
        //                 ],
        //               ),
        //               const SizedBox(
        //                 width: 15,
        //               ),
        //               Row(
        //                 children: [
        //                   Container(
        //                     width: 12,
        //                     height: 12,
        //                     decoration: const BoxDecoration(
        //                       image: DecorationImage(
        //                           image:
        //                               AssetImage('assets/icons/icon_profile.png'),
        //                           fit: BoxFit.cover),
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     width: 5,
        //                   ),
        //                   SizedBox(
        //                     width: 90,
        //                     child: Text(
        //                       lecturerName,
        //                       maxLines: 1,
        //                       overflow: TextOverflow.ellipsis,
        //                       style: const TextStyle(
        //                           fontSize: 9, color: Colors.black),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
