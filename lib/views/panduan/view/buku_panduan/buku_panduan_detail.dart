import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_buku_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';

class BukuPanduanDetail extends GetView<PanduanBukuController> {
  const BukuPanduanDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(Get.arguments[4]),
            Text(
              Get.arguments[5],
              style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
