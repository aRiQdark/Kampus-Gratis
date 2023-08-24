// import 'package:flutter/material.dart';
// import 'package:kampus_gratis/views/modul/component/list_product.dart';
// import 'package:get/get.dart';

// class Video extends StatelessWidget {
//   const Video({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         SizedBox(
//           height: 10,
//         ),
//         SafeArea(child: Text('Muat Sebelumnya')),
//         SingleChildScrollView(
//           child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: modulModels.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Card(
//                     color: Colors.white,
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.toNamed('/detail_dokumen', arguments: [
//                           "${modulModels[index].deskripsi}",
//                           "pPPSPPS"
//                         ]);
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Image(
//                             height: 90,
//                             width: 110,
//                             image: NetworkImage(
//                                 modulModels[index].video![index].thumbnail),
//                           ),
//                           SizedBox(
//                             width: 30,
//                           ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 RichText(
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                   text: TextSpan(
//                                       text:
//                                           '${modulModels[index].video![index].judulVideo}',
//                                       style: const TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20)),
//                                 ),
//                                 RichText(
//                                   maxLines: 4,
//                                   text: TextSpan(
//                                     text: '${modulModels[index].deskripsi}',
//                                     style: TextStyle(
//                                         color: Colors.blueGrey.shade800,
//                                         fontSize: 16.0),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: ElevatedButton(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 10, bottom: 10, left: 60, right: 60),
//                 child: Text('Selesai'),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromARGB(255, 4, 58, 103),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//               ),
//               onPressed: () {
//                 Get.defaultDialog(
//                     titlePadding: EdgeInsets.all(12),
//                     title: "Apa pelajaran yang kamu dapat dari modul ini ?",
//                     middleText: "",
//                     backgroundColor: Colors.white,
//                     titleStyle: TextStyle(color: Colors.black),
//                     middleTextStyle: TextStyle(color: Colors.white),
//                     content: SizedBox(
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 200,
//                             child: TextFormField(
//                               expands: true,
//                               keyboardType: TextInputType.multiline,
//                               textAlign: TextAlign.center,
//                               decoration: InputDecoration(
//                                 hintText: 'Tuliskan Catatan Disini',
//                                 hintStyle: TextStyle(),

//                                 // contentPadding: EdgeInsets.symmetric(
//                                 //     vertical: 70, horizontal: 20),
//                                 border: OutlineInputBorder(),
//                               ),
//                               minLines: null,
//                               maxLines: null,
//                             ),
//                           ),
//                           ElevatedButton(
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 10, bottom: 10, left: 60, right: 60),
//                               child: Text('Selesai'),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color.fromARGB(255, 4, 58, 103),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                             ),
//                             onPressed: () {
//                               Get.toNamed('/home');
//                             },
//                           ),
//                         ],
//                       ),
//                     ));
//               },
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//       ]),
//     );
//   }
// }
