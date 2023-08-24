import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class PanduanCardSecond extends StatelessWidget {
  final String title;
  final String subtitle;
  final String destination;
  const PanduanCardSecond({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (destination == '/panduan/kamus_kg/aplikasi') {
          Get.toNamed(
            destination,
            arguments: ['application', ''],
          );
        }

        if (destination == '/panduan/kamus_kg/kuliah') {
          Get.toNamed(
            destination,
            arguments: ['material', ''],
          );
        }
        Get.toNamed(destination);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            width: 2.5,
            color: Color(0xFF2995B2),
          ),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          title: Text(
            title,
            style: Themes.lightTheme.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              subtitle,
              style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
