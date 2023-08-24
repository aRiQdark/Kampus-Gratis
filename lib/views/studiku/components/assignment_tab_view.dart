// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/themes/themes.dart';


// List listAssignmentCard = [
//   [
//     "Tugas Matriks",
//     "Matematika",
//     "24 Juni 2022, 09:00",
//     false,
//     false,
//     "",
//     0,
//   ],
//   [
//     "Tugas Coding",
//     "Bahasa C++",
//     "27 Juni 2022, 09:00",
//     true,
//     false,
//     "Tenggat waktu habis, temui dosen, atau nilai akan E",
//     0
//   ],
//   [
//     "Tugas Coding",
//     "Python",
//     "24 Juni 2022, 09:00",
//     false,
//     true,
//     "",
//     100,
//   ],
//   [
//     "Tugas Database",
//     "SQL",
//     "24 Juni 2022, 09:00",
//     false,
//     true,
//     "",
//     100,
//   ],
// ];

// class AssignmentTabView extends StatelessWidget {
//   const AssignmentTabView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 4, bottom: 8),
//             child: Text(
//               'Muat Sebelumnya',
//               style: Themes.lightTheme.textTheme.labelMedium,
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               itemCount: 3,
//               separatorBuilder: (BuildContext context, int index) {
//                 return const SizedBox(height: 8);
//               },
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Get.toNamed(
//                       '/studiku/assignment/detail/1?title=${listAssignmentCard[index][0]}&subject=${listAssignmentCard[index][1]}&deadline=${listAssignmentCard[index][2]}&isDeadline=${listAssignmentCard[index][3]}&isDone=${listAssignmentCard[index][4]}&message=${listAssignmentCard[index][5]}&grade=${listAssignmentCard[index][6]}',
//                     );
//                   },
//                   child: AssignmentCard(
//                     title: listAssignmentCard[index][0],
//                     subject: listAssignmentCard[index][1],
//                     deadline: listAssignmentCard[index][2],
//                     isDeadline: listAssignmentCard[index][3],
//                     isDone: listAssignmentCard[index][4],
//                     message: listAssignmentCard[index][5],
//                     grade: listAssignmentCard[index][6],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
