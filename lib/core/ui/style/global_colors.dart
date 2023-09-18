import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.primaryColor;
  Color get transparent => const Color(0x00000000);
  Color get black => const Color(0xFF000000);
  Color get blackText => const Color(0xFF292020);
  Color get grey => const Color(0xFF696B71);
  Color get red => const Color(0xffFB2929);
  Color get greyText => const Color(0xFF5F5353);
  Color get white => const Color(0xFFFFFFFF);
}
