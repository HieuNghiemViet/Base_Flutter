import 'package:flutter/material.dart';

/// Named color based on https://www.htmlcsscolor.com/
class AppColors {
  static Color parseColor(String color) {
    String hex = color.replaceAll("#", "");
    hex = color.replaceAll("0xFF", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex =
          '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }

  static const black = Colors.black;
  static const grey = Colors.grey;
  static const white = Colors.white;
  static const transparent = Colors.transparent;

  static const primary = Color(0xffDE400F);
  static const background = Color(0xffE8E6E9);
  static const raven = Color(0xff667085);
  static const dazzleRose = Color(0xffEE46BC);
  static const dodgerBlue = Color(0xff2E90FA);
  static const cinnabar = Color(0xffF04438);
}
