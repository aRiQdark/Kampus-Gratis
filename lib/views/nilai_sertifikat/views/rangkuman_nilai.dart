// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/controllers/nilai_sertifikat/nilai_controller.dart';
// import 'package:kampus_gratis/utils/loading.dart';
// import 'package:kampus_gratis/widgets/scaffold.dart';

// class RangkumanNilaiView extends GetView<NilaiController> {
//   const RangkumanNilaiView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return KGScaffold(
//         appBar: AppBar(
//           elevation: 2,
//           backgroundColor: Colors.white,
//           leading: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: const Icon(
//                 Icons.chevron_left,
//                 color: Colors.black,
//               )),
//           title: const Text(
//             "Rangkuman Nilai",
//             style: TextStyle(color: Colors.black),
//           ),
//           centerTitle: true,
//         ),
//         body: controller.obx(
//           (state) => state?.studentInformation != null
//               ? ListView(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             spreadRadius: 0,
//                             blurRadius: 1.5,
//                             offset: const Offset(0, 0),
//                           )
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                                 state?.studentInformation?.studentName ?? ''),
//                           ),
//                           const Divider(),
//                           Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text(
//                                       "NIM",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(state?.studentInformation?.nsn ?? ''),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text(
//                                       "Program Studi",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       state?.studentInformation?.major ?? '',
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text(
//                                       "Semester",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                         '${state?.studentInformation?.semester}'),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text(
//                                       "Total SKS  Diambil",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                         '${state?.studentInformation?.creditFinished}'),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text(
//                                       "Jumlah Mata Kuliah Diambil",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                         ('${state?.studentInformation?.subjectsFinished}')),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     const Text(
//                                       "IPK",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                         ('${state?.studentInformation?.gpa ?? 0}')),
//                                   ],
//                                 ),
//                               ]))
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                         child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       padding: const EdgeInsets.only(bottom: 20),
//                       itemCount: state?.subject?.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 100,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                     color: (state?.subject?[index].predicate ==
//                                                 'A' ||
//                                             state?.subject?[index].predicate ==
//                                                 'A+')
//                                         ? controller.aNilai
//                                         : (state?.subject?[index].predicate ==
//                                                     'B' ||
//                                                 state?.subject?[index].predicate ==
//                                                     'B+')
//                                             ? controller.bNilai
//                                             : (state?.subject?[index].predicate ==
//                                                         'C' ||
//                                                     state?.subject?[index]
//                                                             .predicate ==
//                                                         'C+')
//                                                 ? controller.cNilai
//                                                 : (state?.subject?[index]
//                                                                 .predicate ==
//                                                             'D' ||
//                                                         state?.subject?[index]
//                                                                 .predicate ==
//                                                             'D+')
//                                                     ? controller.dNilai
//                                                     : (state?.subject?[index]
//                                                                 .predicate ==
//                                                             'E')
//                                                         ? controller.dNilai
//                                                         : controller.aNilai,
//                                     borderRadius: BorderRadius.circular(8)),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "${state?.subject?[index].predicate}",
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text("${state?.subject?[index].score}")
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 100,
//                                 width: Get.width - 142,
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8),
//                                 margin: const EdgeInsets.only(left: 10),
//                                 decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.2),
//                                         spreadRadius: 0,
//                                         blurRadius: 1.5,
//                                         offset: const Offset(0, 0),
//                                       )
//                                     ],
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8)),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "${state?.subject?[index].name}",
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                         "Bobot SKS: ${state?.subject?[index].credit}"),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                         // } else {
//                         //   return const SizedBox(
//                         //     height: double.infinity,
//                         //     width: double.infinity,
//                         //     child: Center(
//                         //       child: Text(
//                         //         'Belum Ada Data',
//                         //         textAlign: TextAlign.center,
//                         //         textDirection: TextDirection.ltr,
//                         //       ),
//                         //     ),
//                         //   );
//                         // }
//                       },
//                     ))
//                   ],
//                 )
//               : const Text('kosong'),
//           onEmpty: const Text('Data kosong'),
//           onLoading: const LoadingView(),
//         ));
//   }
// }
