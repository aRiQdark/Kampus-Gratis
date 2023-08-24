import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_video_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPanduanDetail extends GetView<PanduanVideoController> {
  const VideoPanduanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !controller.isFullScreen.value
          ? AppBar(
              title: Text(
                Get.arguments[1],
                style: Themes.darkTheme.textTheme.headline6!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF2995B2),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Column(
                      children: [
                        YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: Get.arguments[4],
                              flags: const YoutubePlayerFlags(
                                autoPlay: true,
                                mute: false,
                              ),
                            ),
                          ),
                          onEnterFullScreen: () {
                            controller.isFullScreen.value = true;
                          },
                          onExitFullScreen: () {
                            controller.isFullScreen.value = false;
                          },
                          builder: (context, player) {
                            return Column(
                              children: [
                                player,
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Panduan Pendaftaran',
                  style: Themes.lightTheme.textTheme.headline6!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(Get.arguments[5]);
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.telegram, size: 36),
                      Text(
                        'Bagikan',
                        style: Themes.lightTheme.textTheme.headline6!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi',
              style: Themes.lightTheme.textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              Get.arguments[2],
              style: Themes.lightTheme.textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Source: www.kampusgratis.com',
              style: Themes.lightTheme.textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class VideoPanduanDetail extends StatefulWidget {
//   const VideoPanduanDetail({Key? key}) : super(key: key);

//   static String videoId = '0Rze8CwQw-g';

//   @override
//   State<VideoPanduanDetail> createState() => _VideoPanduanDetailState();
// }

// class _VideoPanduanDetailState extends State<VideoPanduanDetail> {
  // bool isFullScreen = false;

  // final YoutubePlayerController _controller = YoutubePlayerController(
  //     initialVideoId: VideoPanduanDetail.videoId,
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: true,
  //       mute: false,
  //     ));

//   @override
//   Widget build(BuildContext context) {
//     return 
// Scaffold(
//       appBar: !isFullScreen
//           ? AppBar(
//               title: Text(
//                 'Video Panduan Pendaftaran',
//                 style: Themes.darkTheme.textTheme.headline6!.copyWith(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               centerTitle: true,
//               automaticallyImplyLeading: false,
//               backgroundColor: const Color(0xFF2995B2),
//               leading: IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//               ),
//             )
//           : null,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 230,
//               child: ListView.separated(
//                 itemCount: 1,
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const SizedBox(height: 20);
//                 },
//                 itemBuilder: (BuildContext context, int index) {
//                   return SizedBox(
//                     child: Column(
//                       children: [
//                         YoutubePlayerBuilder(
//                           player: YoutubePlayer(
//                             controller: _controller,
//                           ),
//                           onEnterFullScreen: () {
//                             setState(() {
//                               isFullScreen = true;
//                             });
//                           },
//                           onExitFullScreen: () {
//                             setState(() {
//                               isFullScreen = false;
//                             });
//                           },
//                           builder: (context, player) {
//                             return Column(
//                               children: [
//                                 player,
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Panduan Pendaftaran',
//                   style: Themes.lightTheme.textTheme.headline6!.copyWith(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Column(
//                     children: [
//                       const Icon(Icons.telegram, size: 36),
//                       Text(
//                         'Bagikan',
//                         style: Themes.lightTheme.textTheme.headline6!.copyWith(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Deskripsi',
//               style: Themes.lightTheme.textTheme.headline6!.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'AAAAAAAAAAAABBBBBBBBBBBBBBSDJDSKJALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL',
//               style: Themes.lightTheme.textTheme.headline6!.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Source: www.kampusgratis.com',
//               style: Themes.lightTheme.textTheme.headline6!.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
