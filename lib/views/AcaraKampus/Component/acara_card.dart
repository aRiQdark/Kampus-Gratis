import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/Acara%20kampus/Acara_Controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class AcaraCard extends GetView<AcaraController> {
  var nama;

  var price;

  var thumbnail;

  AcaraCard(
      {super.key,
      required this.nama,
      required this.thumbnail,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 267,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 306.63,
              height: 160.41,
              child: Image.network('$thumbnail')),
          const SizedBox(
            height: 11.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Text(
              'Senin, 12 Desember 2022',
              style: Themes.lightTheme.textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Text(
              'Mabim - HMTRPL 2022',
              style: Themes.lightTheme.textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 11),
            width: 50,
            height: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: ColorConstants.green2),
            child: Center(
              child: Text(
                'Gratis',
                style: Themes.darkTheme.textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
