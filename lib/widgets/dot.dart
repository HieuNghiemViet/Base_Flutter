import 'package:base_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final double size;
  final Color? color;
  final EdgeInsets? margin;

  const DotWidget({
    Key? key,
    required this.size,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
