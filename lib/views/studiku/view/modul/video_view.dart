// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/modul_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:readmore/readmore.dart';

class VideoStudikuView extends GetView<ModulController> {
  const VideoStudikuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Studi-Ku',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color(0xff106FA4),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: ColorConstants.mainBlue,
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20),
                child: Image.asset('assets/icons/Logo KG.png',
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller.isYoutubeController(Get.arguments[2]),
        ),
        builder: (context, player) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 14,
                    top: 30,
                  ),
                  child: Text(
                    Get.arguments[0],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 30,
                  ),
                  child: Text(
                    "Deskripsi Video",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 25,
                  ),
                  child: ReadMoreText(
                    Get.arguments[1],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    trimLines: 4,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
