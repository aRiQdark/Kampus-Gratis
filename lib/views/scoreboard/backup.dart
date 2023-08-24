// // Center(
// //                     child: Stack(
// //                       alignment: AlignmentDirectional.topCenter,
// //                       children: [
// //                         Image.asset("assets/images/BG_PapanSkor.png",
// //                             height: 220),
// //                         Container(
// //                           margin: const EdgeInsets.only(top: 16.0),
// //                           child: const Text(
// //                             "Best Student",
// //                             style: TextStyle(
// //                                 fontFamily: "Moonserat",
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.white),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                     child: Column(children: [
// //                       Row(
// //                         crossAxisAlignment: CrossAxisAlignment.end,
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           Stack(
// //                             children: [
// //                               Container(
// //                                 width: 90,
// //                                 height: 130,
// //                                 decoration: BoxDecoration(
// //                                   // ignore: prefer_const_literals_to_create_immutables
// //                                   boxShadow: [
// //                                     const BoxShadow(
// //                                       color: Colors.grey,
// //                                       offset: Offset.infinite,
// //                                       spreadRadius: 1,
// //                                     ),
// //                                   ],
// //                                   borderRadius: BorderRadius.circular(8),
// //                                   color: const Color(0xFFFAFAFA),
// //                                 ),
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     CircleAvatar(
// //                                       radius: 15,
// //                                       child: Container(
// //                                         // ignore: sort_child_properties_last
// //                                         child: const Center(
// //                                           child: Text(
// //                                             '2',
// //                                             style: TextStyle(
// //                                               fontFamily: "Montserrat",
// //                                               color: Color(0xff000000),
// //                                               fontSize: 12,
// //                                               fontWeight: FontWeight.bold,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         width: Get.width,
// //                                         height: Get.height,
// //                                         decoration: const BoxDecoration(
// //                                           shape: BoxShape.circle,
// //                                           color: Color(0xFFE5E5E5),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     const SizedBox(
// //                                       height: 12,
// //                                     ),
// //                                     ClipRect(
// //                                       child: Image.asset(
// //                                           "assets/images/person2.png",
// //                                           width: 45),
// //                                     ),
// //                                     const SizedBox(
// //                                       height: 6,
// //                                     ),
// //                                     Text(
// //                                       data![1].user!.username!,
// //                                       style: const TextStyle(
// //                                         fontFamily: "Montserrat",
// //                                         color: Color(0xff383838),
// //                                         fontSize: 12,
// //                                         fontWeight: FontWeight.bold,
// //                                       ),
// //                                     ),
// //                                     const SizedBox(
// //                                       height: 5,
// //                                     ),
// //                                     const Text(
// //                                       "Poin 20.000",
// //                                       style: TextStyle(
// //                                         fontFamily: "Montserrat",
// //                                         color: Color(0xff383838),
// //                                         fontSize: 12,
// //                                         fontWeight: FontWeight.bold,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           Container(
// //                             width: 112,
// //                             height: 141,
// //                             decoration: BoxDecoration(
// //                               // ignore: prefer_const_literals_to_create_immutables
// //                               boxShadow: [
// //                                 const BoxShadow(
// //                                   color: Colors.grey,
// //                                   offset: Offset.infinite,
// //                                   spreadRadius: 1,
// //                                 ),
// //                               ],
// //                               borderRadius: BorderRadius.circular(8),
// //                               color: const Color(0xFFFAFAFA),
// //                             ),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               children: [
// //                                 CircleAvatar(
// //                                   radius: 15,
// //                                   child: Container(
// //                                     // ignore: sort_child_properties_last
// //                                     child: const Center(
// //                                       child: Text(
// //                                         '1',
// //                                         style: TextStyle(
// //                                           fontFamily: "Montserrat",
// //                                           color: Color(0xff000000),
// //                                           fontSize: 12,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     width: Get.width,
// //                                     height: Get.height,
// //                                     decoration: const BoxDecoration(
// //                                       shape: BoxShape.circle,
// //                                       gradient: LinearGradient(
// //                                         colors: [
// //                                           Color(0xffFFF500),
// //                                           Color(0xffEDA200),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 const SizedBox(
// //                                   height: 12,
// //                                 ),
// //                                 InkWell(
// //                                   onTap: () {},
// //                                   child: ClipRect(
// //                                     child: Image.asset(
// //                                         "assets/images/person2.png",
// //                                         width: 45),
// //                                   ),
// //                                 ),
// //                                 const SizedBox(
// //                                   height: 6,
// //                                 ),
// //                                  Text(
// //                                   data![0].user!.username!,
// //                                   style: TextStyle(
// //                                     fontFamily: "Montserrat",
// //                                     color: Color(0xff383838),
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                                 const SizedBox(
// //                                   height: 10,
// //                                 ),
// //                                 const Text(
// //                                   "Poin 20.000",
// //                                   style: TextStyle(
// //                                     fontFamily: "Montserrat",
// //                                     color: Color(0xff383838),
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                             width: 90,
// //                             height: 130,
// //                             decoration: BoxDecoration(
// //                               // ignore: prefer_const_literals_to_create_immutables
// //                               boxShadow: [
// //                                 const BoxShadow(
// //                                   color: Colors.grey,
// //                                   offset: Offset.infinite,
// //                                   spreadRadius: 1,
// //                                 ),
// //                               ],
// //                               borderRadius: BorderRadius.circular(8),
// //                               color: const Color(0xFFFAFAFA),
// //                             ),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               children: [
// //                                 CircleAvatar(
// //                                   radius: 15,
// //                                   child: Container(
// //                                     // ignore: sort_child_properties_last
// //                                     child: const Center(
// //                                       child: Text(
// //                                         '3',
// //                                         style: TextStyle(
// //                                           fontFamily: "Montserrat",
// //                                           color: Color(0xff000000),
// //                                           fontSize: 12,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     width: Get.width,
// //                                     height: Get.height,
// //                                     decoration: const BoxDecoration(
// //                                       shape: BoxShape.circle,
// //                                       color: Color(0xFFDC9E7B),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 const SizedBox(
// //                                   height: 12,
// //                                 ),
// //                                 ClipRect(
// //                                   child: Image.asset(
// //                                       "assets/images/person2.png",
// //                                       width: 45),
// //                                 ),
// //                                 const SizedBox(
// //                                   height: 6,
// //                                 ),
// //                                 Text(
// //                                   data![2].user!.username!,
// //                                   style: TextStyle(
// //                                     fontFamily: "Montserrat",
// //                                     color: Color(0xff383838),
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                                 const SizedBox(
// //                                   height: 5,
// //                                 ),
// //                                 const Text(
// //                                   "Poin 20.000",
// //                                   style: TextStyle(
// //                                     fontFamily: "Montserrat",
// //                                     color: Color(0xff383838),
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ]),
// //                   ),
// //                   // Container(
// //                   //   height: 32,
// //                   //   width: 32,
// //                   //   color: LinearGradient(colors: [Color(0xffFFF500),Color(0xffEDA200)]),
// //                   // ),

// // const SizedBox(
// //                 height: 41,
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.symmetric(horizontal: 11.0),
// //                 width: 338,
// //                 height: 49,
// //                 decoration: const BoxDecoration(
// //                   color: Colors.blue,
// //                   borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(8),
// //                     topRight: Radius.circular(8),
// //                   ),
// //                 ),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   // ignore: prefer_const_literals_to_create_immutables
// //                   children: [
// //                     const Text(
// //                       "Rank",
// //                       style: TextStyle(
// //                         fontFamily: "Montserrat",
// //                         color: Color(0xffFAFAFA),
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       width: 0,
// //                     ),
// //                     const Text(
// //                       "User",
// //                       style: TextStyle(
// //                         fontFamily: "Montserrat",
// //                         color: Color(0xffFAFAFA),
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       width: 126,
// //                     ),
// //                     const Text(
// //                       "Poin",
// //                       style: TextStyle(
// //                         fontFamily: "Montserrat",
// //                         color: Color(0xffFAFAFA),
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.symmetric(horizontal: 11.0),
// //                 width: 338,
// //                 height: Get.height,
// //                 decoration: const BoxDecoration(
// //                   color: Colors.white,
// //                 ),
// //                 child: ListView.builder(
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   itemCount: data?.length,
// //                   itemBuilder: (context, index) {
// //                     return Column(
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Container(
// //                               margin: const EdgeInsets.only(top: 12, left: 8),
// //                               width: Get.width * 0.15,
// //                               height: 46,
// //                               decoration: BoxDecoration(
// //                                   color: const Color(0XFFFDB415),
// //                                   borderRadius: BorderRadius.circular(10)),
// //                               child: Center(
// //                                 child: Text(
// //                                   (index + 4).toString(),
// //                                   style: const TextStyle(
// //                                     fontFamily: "Montserrat",
// //                                     color: Color(0xff383838),
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             Container(
// //                                 margin:
// //                                     const EdgeInsets.only(top: 12, left: 12),
// //                                 padding: const EdgeInsets.only(
// //                                     left: 10, bottom: 9, top: 9),
// //                                 width: Get.width * 0.72,
// //                                 height: 46,
// //                                 decoration: BoxDecoration(
// //                                   color: const Color(0XFFE5E5E5),
// //                                   borderRadius: BorderRadius.circular(10),
// //                                   boxShadow: [
// //                                     const BoxShadow(
// //                                       color: Colors.grey,
// //                                       offset: Offset.infinite,
// //                                       spreadRadius: 1,
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 child: Row(
// //                                   mainAxisAlignment:
// //                                       MainAxisAlignment.spaceBetween,
// //                                   children: [
// //                                     Row(
// //                                       children: [
// //                                         ClipRect(
//                                           child: Image.asset(
//                                               "assets/images/person2.png",
//                                               width: 29),
// //                                         ),
// //                                         const SizedBox(
// //                                           width: 8,
// //                                         ),
// //                                         Text(
// //                                           data?[index + 3].user?.username ??
// //                                               'Noname',
// //                                           style: const TextStyle(
// //                                             fontFamily: "Montserrat",
// //                                             color: Color(0xff383838),
// //                                             fontSize: 12,
// //                                             fontWeight: FontWeight.bold,
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                     Container(
// //                                       margin: const EdgeInsets.only(right: 10),
// //                                       child: Text(
// //                                         '${data?[index].finalScore}',
// //                                         style: const TextStyle(
// //                                           fontFamily: "Montserrat",
// //                                           color: Color(0xff383838),
// //                                           fontSize: 12,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     )
// //                                   ],
// //                                 )),
// //                           ],
// //                         ),
// //                       ],
// //                     );
// //                   },
// //                 ),
// //               ),