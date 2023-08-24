import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class KGAppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      colorScheme: ThemeData()
          .colorScheme
          .copyWith(primary: ColorConstants.mainColorBlue),
      primaryColor: ColorConstants.mainColorBlue,
      backgroundColor: ColorConstants.background,
      dialogBackgroundColor: ColorConstants.backgroundLight,
      errorColor: ColorConstants.errorColor,
      scaffoldBackgroundColor: ColorConstants.backgroundLight,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 1.0,
        backgroundColor: ColorConstants.backgroundLight,
        shadowColor: Colors.black38,
        foregroundColor: ColorConstants.gray700,
      ),
      textTheme: theme.textTheme.apply(fontFamily: 'Montserrat'),
    );
  }
}
