// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';

// import '../../../../widgets/scaffold.dart';

// class DescriptionQuizView extends GetView<QuizController> {
//   const DescriptionQuizView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return KGScaffold(
//       appBar: AppBar(
//         title: const Text('Description Quiz'),
//       ),
//       body: SafeArea(
//         child: Obx(
//           () {
//             if (controller.isLoading.isTrue) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 21,
//                     vertical: 18,
//                   ),
//                   child: Text(
//                     'Quiz Pertemuan ${Get.arguments[1]}',
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 25,
//                     vertical: 5,
//                   ),
//                   child: Text(
//                     'Aturan',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 32,
//                     vertical: 5,
//                   ),
//                   child: Text(
//                     controller.dataDescriptionQuiz.value!.quiz.description,
//                     textAlign: TextAlign.justify,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 32,
//                     vertical: 5,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 1,
//                           color: const Color(0xff3A0CA3),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.defaultDialog(
//                               radius: 25,
//                               backgroundColor: Colors.white,
//                               title: 'Konfirmasi',
//                               titleStyle: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                               middleText: 'Yakin untuk memulai quiz?',
//                               middleTextStyle:
//                                   const TextStyle(color: Colors.black),
//                               actions: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Get.back();
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.red),
//                                   child: const Text(
//                                     'batal',
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 46,
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//                                     Get.back();
//                                     Get.toNamed(
//                                       'studiku/quiz',
//                                       arguments: [
//                                         controller
//                                             .dataDescriptionQuiz.value!.quiz.id,
//                                         Get.arguments[2],
//                                         Get.arguments[0]
//                                       ],
//                                     );
//                                     await controller.takeQuizByIdQuiz(controller
//                                         .dataDescriptionQuiz.value!.quiz.id);
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.green),
//                                   child: const Text(
//                                     'Yakin',
//                                   ),
//                                 ),
//                               ]);
//                         },
//                         child: Container(
//                           height: 35,
//                           width: 150,
//                           decoration: BoxDecoration(
//                             color: const Color(0xffFDB515),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Mulai Quiz',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 if (controller
//                     .dataDescriptionQuiz.value!.summary.isNotEmpty) ...{
//                   const Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 25,
//                       vertical: 5,
//                     ),
//                     child: Text(
//                       'Riwayat',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 },
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount:
//                         controller.dataDescriptionQuiz.value?.summary.length,
//                     itemBuilder: (context, index) {
//                       double persentase = 0;

//                       if (controller.dataDescriptionQuiz.value!.summary[index]
//                                   .activityDetail.numberOfQuestions !=
//                               0 &&
//                           controller.dataDescriptionQuiz.value!.summary[index]
//                                   .activityDetail.correctAnswers !=
//                               0) {
//                         persentase = 100 /
//                             controller.dataDescriptionQuiz.value!.summary[index]
//                                 .activityDetail.numberOfQuestions *
//                             controller.dataDescriptionQuiz.value!.summary[index]
//                                 .activityDetail.correctAnswers;
//                       }

//                       return Column(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(
//                               left: 25,
//                               right: 25,
//                               top: 8,
//                               bottom: 20,
//                             ),
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 57,
//                               top: 18,
//                               bottom: 18,
//                             ),
//                             height: 162,
//                             width: 299,
//                             decoration: BoxDecoration(
//                               color: const Color(0xffB4D6FF),
//                               borderRadius: BorderRadius.circular(18),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Tanggal       :    ${controller.dataDescriptionQuiz.value!.summary[index].activityDetail.dateSubmit.substring(0, 17)}",
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 if (controller
//                                             .dataDescriptionQuiz
//                                             .value!
//                                             .summary[index]
//                                             .activityDetail
//                                             .numberOfQuestions !=
//                                         0 &&
//                                     controller
//                                             .dataDescriptionQuiz
//                                             .value!
//                                             .summary[index]
//                                             .activityDetail
//                                             .correctAnswers !=
//                                         0) ...{
//                                   Text(
//                                     "Persentase :    ${persentase.toString().substring(0, 2)} %",
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black,
//                                     ),
//                                   )
//                                 } else ...{
//                                   Text(
//                                     "Persentase :    $persentase %",
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black,
//                                     ),
//                                   )
//                                 },
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Text(
//                                       "Status          :",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Container(
//                                       height: 24,
//                                       width: 83,
//                                       decoration: BoxDecoration(
//                                         color: controller
//                                                     .dataDescriptionQuiz
//                                                     .value!
//                                                     .summary[index]
//                                                     .status ==
//                                                 "FAILED"
//                                             ? Colors.red
//                                             : const Color(
//                                                 0xff4D9036,
//                                               ),
//                                         borderRadius: BorderRadius.circular(5),
//                                         border: Border.all(
//                                           width: 1,
//                                           color: controller
//                                                       .dataDescriptionQuiz
//                                                       .value!
//                                                       .summary[index]
//                                                       .status ==
//                                                   "FAILED"
//                                               ? Colors.red
//                                               : const Color(
//                                                   0xff4D9036,
//                                                 ),
//                                         ),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           controller.dataDescriptionQuiz.value!
//                                               .summary[index].status,
//                                           style: const TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Text(
//                                       "Soal              :",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         Get.toNamed(
//                                           "/studiku/quiz/seeAnswer",
//                                           arguments: [
//                                             Get.arguments[1],
//                                             Get.arguments[0]
//                                           ],
//                                         );
//                                         controller.quizReview(
//                                           controller.dataDescriptionQuiz.value!
//                                               .summary[index].id,
//                                         );
//                                       },
//                                       child: Container(
//                                         height: 24,
//                                         width: 83,
//                                         decoration: BoxDecoration(
//                                           color: const Color(0xff4895EF),
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         child: const Center(
//                                           child: Text(
//                                             'Lihat',
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
