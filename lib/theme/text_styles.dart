import 'package:base_flutter/theme/colors.dart';
import 'package:base_flutter/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle get button => t24w500();

  static TextStyle get appbar => t16w700(AppColors.black);

  static TextStyle common(
    double? fontSize,
    FontWeight? fontWeight,
    Color? color, [
    TextDecoration? decoration = TextDecoration.none,
    double? height = 1.25,
    String? fontFamily,
    FontStyle? fontStyle,
  ]) {
    return TextStyle(
      color: color ?? AppColors.black,
      fontWeight: fontWeight,
      fontSize: fontSize,
      decoration: decoration,
      height: height,
      fontFamily: fontFamily ?? FontName.sfProDisplay,
      fontStyle: fontStyle,
    );
  }

  static TextStyle t10w400(
      [Color? color,
      double? height,
      String? fontFamily,
      FontStyle? fontStyle]) {
    return common(
        10.sp, FontWeight.w400, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t12w400(
      [Color? color,
      double? height,
      String? fontFamily,
      FontStyle? fontStyle]) {
    return common(
        12.sp, FontWeight.w400, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t12w500(
      [Color? color,
      double? height,
      String? fontFamily,
      FontStyle? fontStyle]) {
    return common(
        12.sp, FontWeight.w500, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t13w400(
      [Color? color,
        double? height,
        String? fontFamily,
        FontStyle? fontStyle]) {
    return common(
        13.sp, FontWeight.w400, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t13w500(
      [Color? color,
        double? height,
        String? fontFamily,
        FontStyle? fontStyle]) {
    return common(
        13.sp, FontWeight.w500, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t14w400(
      [Color? color,
        double? height,
        String? fontFamily,
        FontStyle? fontStyle]) {
    return common(
        14.sp, FontWeight.w400, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t14w500(
      [Color? color,
        double? height,
        String? fontFamily,
        FontStyle? fontStyle]) {
    return common(
        14.sp, FontWeight.w500, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t14w700([Color? color, double? height]) {
    return common(14.sp, FontWeight.w700, color, null, height);
  }

  static TextStyle t16w400(
      [Color? color,
        double? height,
        String? fontFamily,
        FontStyle? fontStyle]) {
    return common(
        16.sp, FontWeight.w400, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t16w600(
      [Color? color,
        double? height,
        String? fontFamily,
        FontStyle? fontStyle]) {
    return common(
        16.sp, FontWeight.w600, color, null, height, fontFamily, fontStyle);
  }

  static TextStyle t16w700([Color? color, double? height]) {
    return common(16.sp, FontWeight.w700, color, null, height);
  }

  static TextStyle t24w500([Color? color, double? height]) {
    return common(24.sp, FontWeight.w500, color, null, height);
  }
}
