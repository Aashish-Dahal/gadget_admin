import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primary =
      MaterialColor(primaryColor.value, const <int, Color>{
    50: Color(0xFF4D70A0),
    100: Color(0xFF45648E),
    200: Color(0xFF3C587D),
    300: Color(0xFF344C6C),
    400: Color(0xFF23344A),
    500: primaryColor,
    600: Color(0xFF1B2838),
    700: Color(0xFF1B2838),
    800: Color(0xFF131C27),
    900: Color(0xFF0A0F16),
  });
  static const Color primaryColor = Color(0xFF364f6b);
  static const Color greyDark = Color(0xFF57636C);
  static const Color greyLight = Color(0xFF8B97A2);
}
