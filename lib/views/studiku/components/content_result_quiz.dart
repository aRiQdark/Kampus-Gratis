// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
// import 'package:kampus_gratis/themes/themes.dart';
// import 'package:kampus_gratis/views/studiku/components/grid_child_result_quiz.dart';
// import 'package:kampus_gratis/widgets/primary_button.dart';
// // import 'package:percent_indicator/circular_percent_indicator.dart';

// class ContentResultQuiz extends StatefulWidget {
//   const ContentResultQuiz({
//     super.key,
//     required this.controller,
//   });

//   final QuizController controller;

//   @override
//   State<ContentResultQuiz> createState() => _ContentResultQuizState();
// }

// class _ContentResultQuizState extends State<ContentResultQuiz>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController animController;

//   @override
//   void initState() {
//     super.initState();
//     animController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     animation = Tween(begin: 0.5, end: 1.0).animate(animController);

//     animController.forward();
//   }

//   @override
//   void dispose() {
//     animController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: animation,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 16),
//             child: Text(
//               'Kamu mendapatkan nilai',
//               style: Themes.darkTheme.textTheme.headline5,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 40),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 const CircleAvatar(
//                   backgroundColor: Color(0xFF1C87C3),
//                   radius: 90,
//                 ),
//           //       CircularPercentIndicator(
//           //         radius: 80,
//           //         lineWidth: 10,
//           //         percent: widget
//           //                 .controller.dataResultQuiz.value!.correctAnswers /
//           //             widget.controller.dataResultQuiz.value!.numberOfQuestions,
//           //         backgroundColor: const Color(0xFF16D3FD),
//           //         linearGradient: const LinearGradient(
//           //           colors: [
//           //             Color(0xFFFDB415),
//           //             Color(0xFFE5F52F),
//           //             Color(0xFF16D3FD),
//           //           ],
//           //           stops: [0.3, 0.6, 0.9],
//           //           begin: Alignment.bottomRight,
//           //           end: Alignment.topLeft,
//           //         ),
//           //         animation: true,
//           //         animationDuration: 2000,
//           //         curve: Curves.easeIn,
//           //         center: Column(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           children: [
//           //             Text(
//           //               "${widget.controller.dataResultQuiz.value!.score.toInt()}",
//           //               style: Themes.darkTheme.textTheme.subtitle1!.copyWith(
//           //                 fontSize: 64,
//           //                 fontWeight: FontWeight.w700,
//           //               ),
//           //             ),
//           //             Text(
//           //               "Poin",
//           //               style: Themes.darkTheme.textTheme.subtitle1,
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         childAspectRatio: 2.25,
//                         children: [
//                           GridChildResultQuiz(
//                             label: 'Jawaban benar',
//                             content: widget
//                                 .controller.dataResultQuiz.value!.correctAnswers
//                                 .toString(),
//                             contentLabel: 'Soal',
//                           ),
//                           GridChildResultQuiz(
//                             label: 'Waktu selesai',
//                             content: widget.controller
//                                 .formatedTime(widget.controller.dataResultQuiz
//                                     .value!.durationTaken)
//                                 .toString(),
//                           ),
//                           GridChildResultQuiz(
//                             label: 'Jawaban salah',
//                             content:
//                                 "${widget.controller.dataResultQuiz.value!.numberOfQuestions - widget.controller.dataResultQuiz.value!.correctAnswers}",
//                             contentLabel: 'Soal',
//                           ),
//                           GridChildResultQuiz(
//                             label: 'Status quiz',
//                             content:
//                                 widget.controller.dataResultQuiz.value!.status,
//                             status: true,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: PrimaryButton(
//                       label: 'Coba kembali',
//                       color: const Color(0xFF106FA4),
//                       onPressed: () {
//                         Get.offAllNamed('/studiku/main');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
