import 'package:base_flutter/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double cornerRadius;
  final BoxFit? fit;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Widget? placeholder;

  const NetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.cornerRadius = 0,
    this.fit,
    this.borderColor,
    this.borderRadius,
    this.placeholder,
  }) : super(key: key);

  const NetworkImage.circle({
    super.key,
    required this.imageUrl,
    this.fit,
    this.borderColor,
    required double size,
    this.borderRadius,
    this.placeholder,
  })  : width = size,
        height = size,
        cornerRadius = size / 2;

  const NetworkImage.square({
    super.key,
    required this.imageUrl,
    this.fit,
    this.borderColor,
    required double size,
    this.cornerRadius = 0,
    this.borderRadius,
    this.placeholder,
  })  : width = size,
        height = size;

  @override
  Widget build(BuildContext context) {
    Widget placeholder = this.placeholder ??
        Container(
          width: width,
          height: height,
          color: AppColors.primary,
        );
    Widget child;
    if (imageUrl?.isNotEmpty == true) {
      child = CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl!,
        fit: fit ?? BoxFit.cover,
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => placeholder,
      );
    } else {
      child = placeholder;
    }
    if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    } else {
      child = cornerRadius != 0
          ? ClipRRect(
              borderRadius: BorderRadius.circular(cornerRadius),
              child: child,
            )
          : child;
    }
    return borderColor != null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(cornerRadius),
              border: Border.all(color: borderColor!, width: 1),
            ),
            child: child,
          )
        : child;
  }
}
