import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class KGSnackBar {
  Color? backgroundColor, textColor;

  KGSnackBar.showKGSnackBar(BuildContext context, String text,
      {this.backgroundColor, this.textColor}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(20.0),
        content: Text(
          text,
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: textColor ?? Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: backgroundColor ?? ColorConstants.mainBlue,
      ),
    );
  }
}
