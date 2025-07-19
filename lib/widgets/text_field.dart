import 'package:base_flutter/theme/colors.dart';
import 'package:base_flutter/theme/dimens.dart';
import 'package:base_flutter/theme/icons.dart';
import 'package:base_flutter/theme/text_styles.dart';
import 'package:base_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final bool showCursor;
  final bool readOnly;
  final int minLines;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final GestureTapCallback? onTap;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final int? maxLength;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final String? counterText;
  final double cornerRadius;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final bool? markRequired;

  const BaseTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.keyboardType,
    this.textAlign = TextAlign.left,
    this.validator,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.showCursor = true,
    this.readOnly = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatters,
    this.enabled = true,
    this.onTap,
    this.autofocus = false,
    this.hintStyle,
    this.onChanged,
    this.textStyle,
    this.focusNode,
    this.decoration,
    this.maxLength,
    this.obscureText,
    this.enableSuggestions,
    this.autocorrect,
    this.counterText,
    this.prefixIcon,
    this.cornerRadius = BaseDimens.textFieldConnerRadius,
    this.textInputAction,
    this.contentPadding,
    this.onFieldSubmitted,
    this.markRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textField = TextFormField(
      initialValue: initialValue,
      autofocus: autofocus,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      style: textStyle ?? AppTextStyle.t12w400(),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      enableSuggestions: enableSuggestions ?? true,
      autocorrect: autocorrect ?? true,
      validator: validator,
      textAlign: textAlign,
      showCursor: showCursor,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: hint,
            hintStyle: hintStyle,
            enabledBorder: createBorder(),
            focusedBorder: createBorder(),
            errorBorder: createBorder(),
            focusedErrorBorder: createBorder(),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints ??
                const BoxConstraints.expand(width: 48, height: 16),
            counterText: counterText,
            prefixIcon: prefixIcon,
          ),
      inputFormatters: inputFormatters,
      onTap: onTap,
      focusNode: focusNode,
    );
    if (label?.isNotEmpty == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (markRequired == true)
            RequiredLabelText(label!)
          else
            Text(label!, style: AppTextStyle.t12w400()),
          const SizedBox(height: 12),
          textField,
        ],
      );
    }
    return textField;
  }

  InputBorder createBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(cornerRadius),
    );
  }
}

class ClearableTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool? autofocus;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final double? cornerRadius;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets? contentPadding;

  const ClearableTextField({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.hintStyle,
    this.textStyle,
    this.keyboardType,
    this.validator,
    this.autofocus,
    this.onChanged,
    this.focusNode,
    this.cornerRadius,
    this.textInputAction,
    this.onFieldSubmitted,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<ClearableTextField> createState() => _ClearableTextFieldState();
}

class _ClearableTextFieldState extends State<ClearableTextField> {
  late TextEditingController _controller;
  var _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _showClearButton = _controller.text.isNotEmpty;
  }

  @override
  void didUpdateWidget(covariant ClearableTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != null) {
      _controller = widget.controller!;
      _showClearButton = _controller.text.isNotEmpty;
    }
  }

  @override
  void dispose() {
    if (_controller != widget.controller) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      controller: _controller,
      label: widget.label,
      hint: widget.hint,
      hintStyle: widget.hintStyle,
      textStyle: widget.textStyle,
      validator: widget.validator,
      autofocus: widget.autofocus ?? false,
      textInputAction: widget.textInputAction,
      contentPadding: widget.contentPadding,
      onChanged: (value) {
        widget.onChanged?.call(value);
        final showClearButton = value.isNotEmpty;
        if (showClearButton != _showClearButton) {
          setState(() {
            _showClearButton = showClearButton;
          });
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      cornerRadius: widget.cornerRadius ?? BaseDimens.textFieldConnerRadius,
      suffixIcon: _showClearButton
          ? GestureDetector(
              onTap: () {
                _controller.clear();
                widget.onChanged?.call("");
                setState(() {
                  _showClearButton = false;
                });
              },
              child: SvgPicture.asset(AppIcons.home),
            )
          : null,
    );
  }
}
