import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color primary;
  Color darkText;
  Color lightText;
  Color whiteBg;
  Color stroke;
  Color bgColor;
  Color trans;
  Color green;
  Color greenColor;
  Color online;
  Color red;
  Color whiteColor;
  Color buttonColor;


  /// Default constructor
  AppTheme(
      {required this.isDark,
        required this.primary,
        required this.darkText,
        required this.lightText,
        required this.whiteBg,
        required this.stroke,
        required this.bgColor,
        required this.trans,
        required this.online,
        required this.red,
        required this.green,
        required this.whiteColor,
        required this.buttonColor,
        required this.greenColor,
      });




  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
            isDark: false,
            primary: const Color(0xff5465FF),
            darkText: const Color(0xff212121),
            lightText: const Color(0xffCECECE),
            whiteBg: const Color(0xffFFFFFF),
            stroke: const Color(0xffE6E6E6),
            bgColor: const Color(0xffF7F7FC),
            whiteColor: const Color(0xffFFFFFF),
            buttonColor: const Color(0xffEFEFEF),
            trans: Colors.transparent,
            green: Colors.green,
            online: Colors.green,
            red: const Color(0xffFF4B4B),
            greenColor: const Color(0xff27AF4D),

        );




      case ThemeType.dark:
        return AppTheme(
            isDark: true,
            primary: const Color(0xff5465FF),
            darkText: const Color(0xff292929),
            lightText: const Color(0xffCECECE),
            whiteBg: const Color(0xff1A1C28),
            stroke: const Color(0xffE6E6E6),
            bgColor: const Color(0xffF7F7FC),
            whiteColor: const Color(0xffFFFFFF),
          buttonColor: const Color(0xffEFEFEF),
            trans: Colors.transparent,
            green: Colors.green,
            online: Colors.green,
          greenColor: const Color(0xff27AF4D), red: Colors.red,

        );

    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: primary,
        background: whiteBg,
        surface: whiteBg,
        onBackground: whiteBg,
        onSurface: whiteBg,
        onError: Colors.red,
        onPrimary: primary,
        tertiary: whiteBg,
        onInverseSurface: whiteBg,
        tertiaryContainer: whiteBg,
        surfaceTint: whiteBg,
        surfaceVariant: whiteBg,
        onSecondary: primary,
        error: Colors.red,


      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}