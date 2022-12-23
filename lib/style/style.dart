import 'package:flutter/material.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0xff1A1B31);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const pinkcolor = Color(0xffFF2681);
  static const greencolor = Color(0xff0AE8DA);

  // ---------- Gradient   ---------- //

  static const linearGradientLightFirstContainer = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFCCD3C),
        Color(0xffFFFFFF),
      ]);

      static const linearGradientLightThirdContainer = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xff1AC293),
        Color(0xffFFFFFF),
      ]);

        /// ! text style //////

      static textStyleSemiBold({double size = 18, Color textColor = blackColor}) =>
      TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: FontWeight.w600,
      );

  static textStyleNormal(
          {double size = 14,
          Color textColor = blackColor,
         }) =>
      TextStyle(
          fontSize: size,
          color: textColor,
          fontWeight: FontWeight.normal,
        );

  static textStyleBold({double size = 22, Color textColor = blackColor}) =>
      TextStyle(fontSize: size, color: textColor, fontWeight: FontWeight.bold);

  static textStyleSemiRegular(
          {double size = 15, Color textColor = blackColor}) =>
      TextStyle(fontSize: size, color: textColor, fontWeight: FontWeight.w400);
}
