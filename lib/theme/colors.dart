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

  static const primary = Color(0xff8187A1);
  static const background = Color(0xffE8E6E9);
}
