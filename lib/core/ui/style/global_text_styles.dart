import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/extensions/num_extensions.dart';
import 'package:user_register_case_flutter/core/ui/style/global_colors.dart';

extension GlobalTextStyles on BuildContext {
  TextStyle get px14w400 => TextStyle(
        color: blackText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  TextStyle get px14w600 => TextStyle(
        color: blackText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      );
  TextStyle get px16w500 => TextStyle(
        color: blackText,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      );
}
