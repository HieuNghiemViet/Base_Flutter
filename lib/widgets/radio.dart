import 'package:base_flutter/theme/colors.dart';
import 'package:base_flutter/theme/text_styles.dart';
import 'package:flutter/material.dart';

class BaseRadio<T> extends StatelessWidget {
  final String? title;
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final EdgeInsets? padding;
  final TextStyle? normalTextStyle;
  final TextStyle? checkedTextStyle;

  const BaseRadio({
    Key? key,
    this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.padding,
    this.normalTextStyle,
    this.checkedTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isChecked = value == groupValue;
    Widget radio = Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: isChecked
              ? AppColors.primary
              : AppColors.background,
        ),
      ),
      alignment: Alignment.center,
      child: isChecked
          ? Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
    if (title != null) {
      radio = Row(
        children: [
          radio,
          const SizedBox(width: 4),
          Text(title!,
              style: isChecked
                  ? checkedTextStyle ?? AppTextStyle.t12w400()
                  : normalTextStyle ?? AppTextStyle.t12w400()),
        ],
      );
    }
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged?.call(value);
        }
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
        child: radio,
      ),
    );
  }
}
