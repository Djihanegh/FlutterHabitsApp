import 'package:flutter/material.dart';

/// All the app colors used in the app

class AppColors {
  static const kPrimaryColor = Color(0xFF8338EC);
  static const kLinearColor = Color(0xFF7F5BFF);

  static const kPrimaryDarkColor = Color(0xFF712BD3);
  static const kSecondaryColor = Color(0xFFFFB706);

  static const kPrimaryText = Color(0xFF383E53);
  static const kSecondaryText = Color(0xFF939295);

  static const backGroundColor = Color(0xFFE5E5E5);
  static const selectedHabitColor = Color(0xFFF8F3FF);

  static const divierColor = Color(0xFFF6F7FB);
  static const kbackgroundColor = Color(0xFFFCFBFF);

 static const kgreyColor = Color(0xFFE9E9E9);


  static const kPrimaryGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter, // 10% of the width, so there are ten blinds.
    colors: <Color>[
      Color(0xff8338EC),
      Color(0xff7F5BFF),
    ], // red to yellow
    tileMode: TileMode.mirror, // repeats the gradient over the canvas
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class CustomGradientDecoration extends BoxDecoration {
  const CustomGradientDecoration({this.customBorderRadius});
  final BorderRadius? customBorderRadius;
  @override
  BorderRadiusGeometry? get borderRadius =>
      customBorderRadius ?? super.borderRadius;
  @override
  Gradient? get gradient => AppColors.kPrimaryGradient;

  @override
  List<BoxShadow>? get boxShadow => [
        //Drop shadow
        const BoxShadow(
          color: Color(0x01BDACFB),
          blurRadius: 20,
          spreadRadius: 0,
          offset: Offset(0, 8),
        ),
        //inner shadow
        const BoxShadow(
          color: Color(0x80FFFFFF),
          blurRadius: 15,
          spreadRadius: 0,
          offset: Offset(3, 1),
        ),
        const BoxShadow(
          color: Color(0x5E000000),
          blurRadius: 10,
          spreadRadius: 0,
          offset: Offset(0, 3),
        )
      ];
}
