import 'package:flutter/material.dart';

class ColorHelper {
  // Hexadecimal color values are always 6 characters long
  static const HEX_COLOR_LENGTH = 6;

  // Hexadecimal color values may only contain the decimal digits 0..9 and the letters 'A'..'F'
  // The corresponding radix value is 16
  static const COLOR_RADIX = 16;

  /// Converts a hexadecimal color value to dart color type
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == HEX_COLOR_LENGTH) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: COLOR_RADIX));
  }
}
