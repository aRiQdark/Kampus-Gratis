// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/views/modul/component/list_product.dart';

// class Dokumen extends StatelessWidget {
//   const Dokumen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         padding: EdgeInsets.only(top: 20, right: 20, left: 20),
//         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 250, crossAxisSpacing: 10, mainAxisSpacing: 20),
//         itemCount: modulModels.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return Card(
//             color: Color.fromARGB(255, 156, 184, 231),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.toNamed('/detail_dokumen', arguments: [
//                         "${modulModels[index].deskripsi}",
//                         "pPPSPPS"
//                       ]);
//                     },
//                     child: Container(
//                       height: 100,
//                       width: 250,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.grey.shade300,
//                       ),
//                       child: Icon(
//                         Icons.file_copy,
//                         size: 50,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '${modulModels[index].judulModul}',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
