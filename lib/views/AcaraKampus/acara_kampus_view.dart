import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/Acara%20kampus/Acara_Controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/views/AcaraKampus/Component/acara_card.dart';

import '../../themes/themes.dart';
import '../../widgets/app_bar.dart';

class AcaraKampusView extends GetView<AcaraController> {
  const AcaraKampusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.grey40,
      appBar: const KGAppBar(
        backButton: true,
        title: 'Acara Kampus',
        withIconKG: true,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text(
              '',
              style: Themes.lightTheme.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 18.0, 40, 22),
              child: controller.obx(
                (data) => ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AcaraCard(
                      nama: data[index].name,
                      thumbnail: data[index].thumbnail,
                      price: data[index].price,
                    );
                  },
                ),
              ))
        ]),
      ),
    );
  }
}
