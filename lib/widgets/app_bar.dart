import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class KGAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool backButton;
  final bool withIconKG;
  final double? elevation;
  final String title;

  const KGAppBar(
      {super.key,
      required this.backButton,
      required this.title,
      required this.withIconKG,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.mainBlue,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.mainBlue,
          statusBarBrightness: Brightness.dark),
      automaticallyImplyLeading: false,
      elevation: elevation,
      toolbarHeight: 78,
      leading: backButton
          ? IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ))
          : null,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffF3F3F3)),
      ),
      centerTitle: true,
      actions: withIconKG
          ? <Widget>[
              Container(
                width: 30.0,
                margin: const EdgeInsets.only(right: 24.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/Logo KG.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(78);
}
