import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? title;
  final bool withIconKG;
  const CustomAppBar(
      {super.key, this.height = 100, this.title, required this.withIconKG});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      toolbarHeight: height,
      leadingWidth: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: ColorConstants.mainBlue,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.mainBlue,
          statusBarBrightness: Brightness.dark),
      actions: withIconKG
          ? <Widget>[
              Container(
                width: 30.0,
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
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
  Size get preferredSize => Size.fromHeight(height);
}
