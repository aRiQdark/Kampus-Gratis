import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_video_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_card.dart';

class VideoPanduan extends GetView<PanduanVideoController> {
  const VideoPanduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video Panduan',
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OVERVIEW',
                style: Themes.lightTheme.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Berupa video tutorial penggunaan dan fungsi fitur yang ada di Mobile apps KG',
                style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              controller.obx(
                (data) => SizedBox(
                  height: 400,
                  child: ListView.separated(
                    itemCount: data!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return PanduanCard(
                        id: data[index].id!,
                        title: data[index].title!,
                        description: data[index].description!,
                        icon: Icons.play_circle,
                        url: data[index].content!.url!,
                        destination: '/panduan/video/detail',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
