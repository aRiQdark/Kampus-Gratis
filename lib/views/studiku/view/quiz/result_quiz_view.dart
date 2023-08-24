// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
// import 'package:kampus_gratis/themes/themes.dart';
// import 'package:kampus_gratis/views/studiku/components/content_result_quiz.dart';

// class ResultQuizView extends GetView<QuizController> {
//   const ResultQuizView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: const Color(0xFF106FA4),
//           body: Obx(
//             () {
//               if (controller.isLoading.value == true) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: const LinearProgressIndicator(
//                           color: Color(0xFFFDB415),
//                           backgroundColor: Colors.white,
//                           minHeight: 20,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       "Menghitung hasil quiz",
//                       style: Themes.darkTheme.textTheme.subtitle1,
//                     ),
//                   ],
//                 );
//               }

//               return ContentResultQuiz(controller: controller);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';

// // class ResultQuizView extends GetView<QuizController> {
// //   const ResultQuizView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () => Future.value(false),
// //       child: Scaffold(
// //         body: SafeArea(child: Obx(
// //           () {
// //             if (controller.isLoading.isTrue) {
// //               return const Center(
// //                 child: CircularProgressIndicator(),
// //               );
// //             }
// //             int wrongAnswer =
// //                 controller.dataResultQuiz.value!.numberOfQuestions -
// //                     controller.dataResultQuiz.value!.correctAnswers;
// //             return SingleChildScrollView(
// //               child: Stack(
// //                 children: [
// //                   Container(
// //                     padding: const EdgeInsets.symmetric(
// //                       horizontal: 30,
// //                       vertical: 35,
// //                     ),
// //                     height: 540,
// //                     width: double.infinity,
// //                     decoration: const BoxDecoration(
// //                         color: Color(0xff0E69D3),
// //                         borderRadius: BorderRadius.only(
// //                           bottomRight: Radius.circular(30),
// //                           bottomLeft: Radius.circular(30),
// //                         )),
// //                     child: Column(
// //                       children: [
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             const Text(
// //                               "Hasil Quiz",
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             IconButton(
// //                               onPressed: () => Get.offAllNamed('/studiku/main'),
// //                               icon: const Icon(Icons.close),
// //                               color: Colors.grey,
// //                             )
// //                           ],
// //                         ),
// //                         Container(
// //                           height: 2,
// //                           width: double.infinity,
// //                           color: const Color(0xffB4D6FF),
// //                         ),
// //                         const SizedBox(
// //                           height: 8,
// //                         ),
// //                         Row(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               "Tanggal : ",
// //                               style: TextStyle(
// //                                 fontSize: 14,
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   controller.dataResultQuiz.value!.dateSubmitted
// //                                       .substring(0, 19),
// //                                   style: const TextStyle(
// //                                     fontSize: 12,
// //                                     color: Colors.white,
// //                                     fontWeight: FontWeight.w400,
// //                                   ),
// //                                 ),
// //                                 Text(
// //                                   controller.dataResultQuiz.value!.dateSubmitted
// //                                       .substring(19),
// //                                   style: const TextStyle(
// //                                     fontSize: 12,
// //                                     color: Colors.white,
// //                                     fontWeight: FontWeight.w400,
// //                                   ),
// //                                 ),
// //                               ],
// //                             )
// //                           ],
// //                         ),
// //                         const SizedBox(
// //                           height: 16,
// //                         ),
// //                         const SizedBox(
// //                           height: 24,
// //                         ),
// //                         Container(
// //                           height: 99,
// //                           width: 138,
// //                           decoration: BoxDecoration(
// //                             color: const Color(0xffFDB515),
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                           child: Center(
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 const Text(
// //                                   "Total Score",
// //                                   style: TextStyle(
// //                                     fontSize: 16,
// //                                     color: Colors.black,
// //                                   ),
// //                                 ),
// //                                 Text(
// //                                   controller.dataResultQuiz.value!.score
// //                                       .toString(),
// //                                   style: const TextStyle(
// //                                     fontSize: 40,
// //                                     color: Colors.black,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 21,
// //                         ),
// //                         Center(
// //                           child: Text(
// //                             "Quiz ${Get.arguments[1]}",
// //                             style: const TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.white,
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                             textAlign: TextAlign.center,
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 11,
// //                         ),
// //                         Center(
// //                           child: Text(
// //                             controller.dataResultQuiz.value!.status == "FAILED"
// //                                 ? "Nilai anda kurang dari KKM , semangat untuk terus meraih nilai yang lebih baik lagi"
// //                                 : "Nilai anda sudah bagus , semangat untuk terus meraih nilai yang lebih baik lagi",
// //                             style: const TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.white,
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                             textAlign: TextAlign.center,
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 19,
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     margin: const EdgeInsets.only(
// //                       top: 450,
// //                       left: 36,
// //                       right: 36,
// //                     ),
// //                     padding: const EdgeInsets.symmetric(
// //                       vertical: 22,
// //                       horizontal: 6,
// //                     ),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: const BorderRadius.only(
// //                         topRight: Radius.circular(30),
// //                         topLeft: Radius.circular(30),
// //                       ),
// //                       border: Border.all(width: 1, color: Colors.grey),
// //                     ),
// //                     child: Column(
// //                       children: [
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                           children: [
// //                             Container(
// //                               height: 81,
// //                               width: 80,
// //                               padding: const EdgeInsets.symmetric(
// //                                 vertical: 10,
// //                                 horizontal: 10,
// //                               ),
// //                               decoration: BoxDecoration(
// //                                   color: Colors.white,
// //                                   borderRadius: const BorderRadius.only(
// //                                     bottomRight: Radius.circular(15),
// //                                     bottomLeft: Radius.circular(15),
// //                                   ),
// //                                   boxShadow: [
// //                                     BoxShadow(
// //                                       color: Colors.grey.withOpacity(0.5),
// //                                       spreadRadius: 2,
// //                                       blurRadius: 2,
// //                                       offset: const Offset(0, 2),
// //                                     )
// //                                   ]),
// //                               child: Column(
// //                                 children: [
// //                                   const Text(
// //                                     "Benar",
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       color: Colors.black,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     controller
// //                                         .dataResultQuiz.value!.correctAnswers
// //                                         .toString(),
// //                                     style: const TextStyle(
// //                                       fontSize: 30,
// //                                       color: Colors.green,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                             Container(
// //                               height: 81,
// //                               width: 80,
// //                               padding: const EdgeInsets.symmetric(
// //                                 vertical: 10,
// //                                 horizontal: 10,
// //                               ),
// //                               decoration: BoxDecoration(
// //                                   color: Colors.white,
// //                                   borderRadius: const BorderRadius.only(
// //                                     bottomRight: Radius.circular(15),
// //                                     bottomLeft: Radius.circular(15),
// //                                   ),
// //                                   boxShadow: [
// //                                     BoxShadow(
// //                                       color: Colors.grey.withOpacity(0.5),
// //                                       spreadRadius: 2,
// //                                       blurRadius: 2,
// //                                       offset: const Offset(0, 2),
// //                                     )
// //                                   ]),
// //                               child: Column(
// //                                 children: [
// //                                   const Text(
// //                                     "Salah",
// //                                     style: TextStyle(
// //                                       fontSize: 16,
// //                                       color: Colors.black,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     wrongAnswer.toString(),
// //                                     style: const TextStyle(
// //                                       fontSize: 30,
// //                                       color: Colors.red,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(
// //                           height: 17,
// //                         ),
// //                         Container(
// //                           height: 81,
// //                           width: 100,
// //                           padding: const EdgeInsets.symmetric(
// //                             vertical: 10,
// //                             horizontal: 10,
// //                           ),
// //                           decoration: BoxDecoration(
// //                               color: Colors.white,
// //                               borderRadius: const BorderRadius.only(
// //                                 bottomRight: Radius.circular(15),
// //                                 bottomLeft: Radius.circular(15),
// //                               ),
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.grey.withOpacity(0.5),
// //                                   spreadRadius: 2,
// //                                   blurRadius: 2,
// //                                   offset: const Offset(0, 2),
// //                                 )
// //                               ]),
// //                           child: Column(
// //                             children: [
// //                               const Text(
// //                                 "Total Soal",
// //                                 style: TextStyle(
// //                                   fontSize: 15,
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 controller
// //                                     .dataResultQuiz.value!.numberOfQuestions
// //                                     .toString(),
// //                                 style: const TextStyle(
// //                                   fontSize: 30,
// //                                   color: Colors.black,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 40,
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           },
// //         )),
// //       ),
// //     );
// //   }
// // }
