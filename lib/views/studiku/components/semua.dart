// import 'package:flutter/material.dart';
// import 'package:kampus_gratis/views/modul/component/list_product.dart';

// class Semua extends StatelessWidget {
//   const Semua({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         SizedBox(
//           height: 10,
//         ),
//         SingleChildScrollView(
//           child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: modulModels.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                               width: 150,
//                               child: Column(
//                                 children: [
//                                   Text("${modulModels[index].namaVideo}"),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Image.network(
//                                       modulModels[index].thumbnail,
//                                       fit: BoxFit.cover),
//                                 ],
//                               )),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Card(
//                             color: Color.fromARGB(255, 156, 184, 231),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 100,
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: Colors.grey.shade300,
//                                     ),
//                                     child: Icon(
//                                       Icons.file_copy,
//                                       size: 50,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Lampiran',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }),
//         ),
//       ]),
//     );
//   }
// }
