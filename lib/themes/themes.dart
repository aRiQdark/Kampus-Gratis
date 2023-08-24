import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // primarySwatch: Colors.blue,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: ColorConstants.mainColorBlue),
    primaryColor: ColorConstants.mainColorBlue,
    primaryColorLight: ColorConstants.gray50,
    // primaryColorDark: ColorConstants.gray900,
    brightness: Brightness.light,
    backgroundColor: ColorConstants.background,
    appBarTheme:
        AppBarTheme(backgroundColor: ColorConstants.mainBlue, elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        hintStyle: const TextStyle(
          fontSize: 14,
        )),

    textTheme: TextTheme(
        headline1: const TextStyle(
          letterSpacing: -1.5,
          fontSize: 48,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        headline2: const TextStyle(
          letterSpacing: -1.0,
          fontSize: 40,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        headline3: const TextStyle(
          letterSpacing: -1.0,
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        headline4: const TextStyle(
          letterSpacing: -1.0,
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
        headline5: const TextStyle(
          letterSpacing: -1.0,
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
        ),
        headline6: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
        ),
        subtitle1: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
        subtitle2: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
        ),
        bodyText1: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
        bodyText2: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
        button: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
        caption: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        overline: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5)),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColorDark: ColorConstants.gray400,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    backgroundColor: ColorConstants.gray400,
    scaffoldBackgroundColor: ColorConstants.gray900,
    appBarTheme:
        AppBarTheme(backgroundColor: ColorConstants.gray400, elevation: 1),
    bottomAppBarColor: ColorConstants.gray800,
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        hintStyle: const TextStyle(
          fontSize: 14,
        )),
    textTheme: TextTheme(
        headline1: TextStyle(
            letterSpacing: -1.5,
            fontSize: 48,
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            letterSpacing: -1.0,
            fontSize: 40,
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            letterSpacing: -1.0,
            fontSize: 32,
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            letterSpacing: -1.0,
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontSize: 28,
            fontWeight: FontWeight.w600),
        headline5: TextStyle(
            letterSpacing: -1.0,
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w500),
        headline6: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w500),
        subtitle2: TextStyle(
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            color: Colors.grey.shade50,
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w400),
        button: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600),
        caption: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.grey.shade50,
            fontSize: 12,
            fontWeight: FontWeight.w500),
        overline: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.grey.shade50,
            fontSize: 10,
            fontWeight: FontWeight.w400)),
  );
}
