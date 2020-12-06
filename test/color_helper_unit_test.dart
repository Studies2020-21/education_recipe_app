import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:education_recipe_app/helpers/color_helper.dart';

void main() {
  group('Color Helper', () {
    test('A hexadecimal color value should be converted to correct dart color type', () {
      expect(
        ColorHelper.getColorFromHex('#00ff00'),
        Color(0xff00ff00),
      );
    });

    test('A hexadecimal color value (without #) should be converted to correct dart color type', () {
      expect(
        ColorHelper.getColorFromHex('0000ff'),
        Color(0xff0000ff),
      );
    });
  });
}
