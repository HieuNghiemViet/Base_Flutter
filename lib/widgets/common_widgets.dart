import 'package:base_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget space({double? w, double? h}) {
  return SizedBox(
    width: w,
    height: h,
  );
}

Widget divider({
  double height = 1,
  double? thickness,
  Color? color = AppColors.black,
  double? indent,
  double? endIndent,
  EdgeInsetsGeometry? margin,
}) {
  var divider = Divider(
    height: height,
    thickness: thickness ?? height,
    color: color,
    indent: indent,
    endIndent: endIndent ?? indent,
  );

  if (margin == null) return divider;

  return Padding(padding: margin, child: divider);
}

EdgeInsets paddingScreen() {
  return EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w);
}
