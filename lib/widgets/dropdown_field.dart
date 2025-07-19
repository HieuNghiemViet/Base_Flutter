import 'package:base_flutter/base.dart';

class BaseDropdownField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final GestureTapCallback? onTap;
  final bool enabled;
  final bool? markRequired;

  const BaseDropdownField({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.onTap,
    this.enabled = true,
    this.markRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      controller: controller,
      label: label,
      hint: hint,
      readOnly: true,
      showCursor: false,
      enabled: enabled,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset(
          AppIcons.dropdown,
          color: AppColors.dodgerBlue,
        ),
      ),
      onTap: enabled ? onTap : null,
      markRequired: markRequired,
    );
  }
}
