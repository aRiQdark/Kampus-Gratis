// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/controllers/studiku/assignment_controller.dart';
// import 'package:kampus_gratis/extensions/thumbnail.dart';
// import 'package:kampus_gratis/themes/themes.dart';
// import 'package:kampus_gratis/views/studiku/components/card_lampiran.dart';

// class AssignmentDetailView extends GetView<AssignmentController> {
//   const AssignmentDetailView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           body: controller.obx(
//             (state) => SafeArea(
//               child: Stack(
//                 children: [
//                   SingleChildScrollView(
//                     padding: const EdgeInsets.all(16.0),
//                     physics: const NeverScrollableScrollPhysics(),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: const Icon(
//                             Icons.arrow_back_ios,
//                             size: 28,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 '${state!.assignment?.content}',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Themes.lightTheme.textTheme.headline5,
//                               ),
//                             ),
//                             Text(
//                               'NILAI',
//                               style: Themes.lightTheme.textTheme.labelMedium,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 'Tenggat ${state.assignment?.deadline}',
//                                 style: Themes.lightTheme.textTheme.labelMedium,
//                               ),
//                             ),
//                             state.studentsWork?.score == null
//                                 ? Text(
//                                     '0/100',
//                                     style:
//                                         Themes.lightTheme.textTheme.labelMedium,
//                                   )
//                                 : Text(
//                                     '${state.studentsWork?.score}/100',
//                                     style:
//                                         Themes.lightTheme.textTheme.labelMedium,
//                                   ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                           ],
//                         ),
//                         const Divider(
//                           color: Colors.black,
//                         ),
//                         Text(
//                           '${state.assignment?.description}',
//                           textAlign: TextAlign.left,
//                           style: Themes.lightTheme.textTheme.subtitle2,
//                         ),
//                         const SizedBox(height: 10),
//                         ConstrainedBox(
//                           constraints: BoxConstraints(
//                             maxHeight: Get.height,
//                           ),
//                           child: GridView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             // itemCount: state.assignment.fileAssignmentLink.length,
//                             itemCount: 4,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: 1.4,
//                               mainAxisSpacing: 5.0,
//                               crossAxisSpacing: 5.0,
//                             ),
//                             itemBuilder: (context, index) {
//                               return CardLampiran(
//                                 assignmentFile:
//                                     '${state.assignment?.fileAssignment}',
//                                 name: '${state.assignment?.fileAssignment}',
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   DraggableScrollableSheet(
//                     snap: true,
//                     initialChildSize: 0.13,
//                     maxChildSize: 0.7,
//                     minChildSize: 0.13,
//                     builder: (BuildContext context,
//                         ScrollController scrollController) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(24),
//                           ),
//                           color: Colors.blue.shade100,
//                         ),
//                         child: SingleChildScrollView(
//                           padding: const EdgeInsets.all(20),
//                           controller: scrollController,
//                           child: Column(
//                             children: [
//                               const Icon(
//                                   Icons.keyboard_double_arrow_up_outlined),
//                               const SizedBox(height: 8),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Tugas Anda',
//                                     style:
//                                         Themes.lightTheme.textTheme.headline6,
//                                   ),
//                                   state.studentsWork?.status == 'GRADING' &&
//                                           controller.isLate.value
//                                       ? const Text(
//                                           'Diserahkan',
//                                           style: TextStyle(
//                                             fontSize: 18,
//                                             color: Colors.green,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         )
//                                       : Obx(
//                                           () => controller.isLate.value
//                                               ? state
//                                                           .studentsWork
//                                                           ?.activityDetail
//                                                           ?.fileAssignment ==
//                                                       null
//                                                   ? const Text(
//                                                       'Belum Diserahkan',
//                                                       style: TextStyle(
//                                                         fontSize: 18,
//                                                         color: Colors.red,
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                       ),
//                                                     )
//                                                   : const Text(
//                                                       'Telat',
//                                                       style: TextStyle(
//                                                         fontSize: 18,
//                                                         color: Colors.red,
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                       ),
//                                                     )
//                                               : Text(
//                                                   'Ditugaskan',
//                                                   style: Themes.lightTheme
//                                                       .textTheme.headline6,
//                                                 ),
//                                         )
//                                 ],
//                               ),
//                               const SizedBox(height: 20),
//                               state.studentsWork?.status == 'GRADING' ||
//                                       state.studentsWork?.status == 'LATE'
//                                   ? Card(
//                                       elevation: 3,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: ListTile(
//                                         leading: CircleAvatar(
//                                           child: SvgPicture.asset(
//                                             thumbnail(
//                                                 '${state.studentsWork?.activityDetail?.fileAssignment}'),
//                                             fit: BoxFit.cover,
//                                             clipBehavior: Clip.antiAlias,
//                                           ),
//                                         ),
//                                         title: Text(
//                                           controller.filenameFromAPI.value,
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                         onTap: () =>
//                                             controller.openFileFromAPI(),
//                                       ),
//                                     )
//                                   : Obx(
//                                       () => !controller.isEmpty.value &&
//                                               state.studentsWork?.activityDetail
//                                                       ?.fileAssignment ==
//                                                   null
//                                           ? Card(
//                                               elevation: 3,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                               child: ListTile(
//                                                 leading: CircleAvatar(
//                                                   child: SvgPicture.asset(
//                                                     thumbnail(
//                                                         '${controller.file?.path}'),
//                                                     fit: BoxFit.cover,
//                                                     clipBehavior:
//                                                         Clip.antiAlias,
//                                                   ),
//                                                 ),
//                                                 title: Text(
//                                                   controller.fileName.value,
//                                                   maxLines: 2,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                 ),
//                                                 trailing: IconButton(
//                                                   onPressed: () {
//                                                     controller.removeFile();
//                                                   },
//                                                   icon:
//                                                       const Icon(Icons.cancel),
//                                                 ),
//                                                 onTap: () =>
//                                                     controller.openFile(),
//                                               ),
//                                             )
//                                           : const Text(
//                                               'Belum ada tugas yang dikumpulkan'),
//                                     ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           bottomNavigationBar: controller.obx(
//             (state) => BottomAppBar(
//               color: Colors.white,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: state!.studentsWork?.status == 'GRADING' ||
//                         state.studentsWork?.status == 'LATE'
//                     ? ElevatedButton(
//                         onPressed: () {
//                           controller.cancelStudentWork();
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFFDB515),
//                             elevation: 3,
//                             padding: const EdgeInsets.symmetric(vertical: 12.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             )),
//                         child: const Text(
//                           'Batalkan',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       )
//                     : Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 backgroundColor: const Color(0xFF0E69D3),
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(15),
//                                   ),
//                                 ),
//                                 builder: (context) {
//                                   return SizedBox(
//                                     height: 200,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.stretch,
//                                         children: [
//                                           const Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'Pilih Tindakan',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ),
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               SizedBox(
//                                                 width: 80,
//                                                 child: InkWell(
//                                                   onTap: () async {
//                                                     await controller
//                                                         .openCamera();
//                                                     Get.back();
//                                                   },
//                                                   child: Column(
//                                                     children: const [
//                                                       Icon(
//                                                         Icons.camera_alt,
//                                                         size: 50,
//                                                         color: Colors.white,
//                                                       ),
//                                                       Text(
//                                                         'Kamera',
//                                                         style: TextStyle(
//                                                           fontSize: 14,
//                                                           color: Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 80,
//                                                 child: InkWell(
//                                                   onTap: () async {
//                                                     // await controller.pickFile();
//                                                     // Get.back();
//                                                   },
//                                                   child: Column(
//                                                     children: const [
//                                                       Icon(
//                                                         Icons.circle,
//                                                         size: 50,
//                                                         color: Colors.white,
//                                                       ),
//                                                       Text(
//                                                         'Perekam',
//                                                         style: TextStyle(
//                                                           fontSize: 14,
//                                                           color: Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 80,
//                                                 child: InkWell(
//                                                   onTap: () async {
//                                                     await controller.pickFile();
//                                                     Get.back();
//                                                   },
//                                                   child: Column(
//                                                     children: const [
//                                                       Icon(
//                                                         Icons.upload_file,
//                                                         size: 50,
//                                                         color: Colors.white,
//                                                       ),
//                                                       Text(
//                                                         'File',
//                                                         style: TextStyle(
//                                                           fontSize: 14,
//                                                           color: Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () {
//                                               Get.back();
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               elevation: 10,
//                                               backgroundColor:
//                                                   const Color(0xFFD6E8FF),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                               ),
//                                             ),
//                                             child: const Text(
//                                               'Batal',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: 3,
//                               backgroundColor: const Color(0xFF0E69D3),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Icon(Icons.add),
//                                 SizedBox(width: 12),
//                                 Text('Tambah atau Buat'),
//                               ],
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               !controller.isEmpty.value
//                                   ? controller.submitStudentWork()
//                                   : Get.defaultDialog(
//                                       title: 'Tidak ada File',
//                                       middleText:
//                                           'Mohon tambahkan File terlebih dahulu',
//                                     );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: 3,
//                               backgroundColor: Colors.white,
//                             ),
//                             child: Obx(
//                               () => Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   controller.isEmpty.value
//                                       ? const Text(
//                                           'Tandai sebagai selesai',
//                                           style: TextStyle(
//                                             color: Color(0xFF0E69D3),
//                                           ),
//                                         )
//                                       : const Text(
//                                           'Serahkan',
//                                           style: TextStyle(
//                                             color: Color(0xFF0E69D3),
//                                           ),
//                                         ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//               ),
//             ),
//           ),
//         ),
//         Obx(
//           () => controller.isLoading.value
//               ? Container(
//                   width: Get.width,
//                   height: Get.height,
//                   color: Colors.black38,
//                   child: const Center(
//                     child: CircularProgressIndicator.adaptive(),
//                   ),
//                 )
//               : const SizedBox(),
//         ),
//       ],
//     );
//   }
// }
