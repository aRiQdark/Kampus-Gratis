import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/artikel/artikel_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';

class ArtikelDetailsView extends GetView<ArtikelController> {
  const ArtikelDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Get.isDarkMode ? Colors.white10 : ColorConstants.gray700,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: controller.obx(
        (data) {
          String? gambar = '${data?[index]?.imageLink}';
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kPadding, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250.0,
                    constraints:
                        const BoxConstraints(maxWidth: 450, maxHeight: 250),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(gambar)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(kBorderRadius),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '${DateFormat.yMMMMd('id_ID').format(data?[index]?.createdAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data?[index]?.createdAt ?? DateTime.now())} WIB',
                    style: theme.textTheme.caption,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    data?[index]?.title ?? '',
                    style: theme.textTheme.headline6,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    data?[index]?.description ?? '',
                    style: theme.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          );
        },
        onLoading: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onError: (err) => Center(
          child: Text(err ?? ''),
        ),
      ),
    );
  }
}
