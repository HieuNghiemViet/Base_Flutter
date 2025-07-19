import 'package:base_flutter/widgets/text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final int maxLength;
  final TextEditingController controller;
  final bool autofocus;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final Widget togglePasswordIcon;
  final ValueChanged<String>? onChanged;

  const PasswordTextField({
    Key? key,
    this.maxLength = 6,
    required this.controller,
    this.autofocus = true,
    required this.label,
    required this.hint,
    this.keyboardType,
    required this.togglePasswordIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PasswordTextFieldState();
  }
}

class PasswordTextFieldState extends State<PasswordTextField>
    with SingleTickerProviderStateMixin {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
        controller: widget.controller,
        label: widget.label,
        hint: widget.hint,
        keyboardType: widget.keyboardType,
        obscureText: !_passwordVisible,
        maxLength: widget.maxLength,
        counterText: "",
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        suffixIcon: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(
              maxHeight: 11.0,
              maxWidth: 11.0,
            ),
            child: widget.togglePasswordIcon,
          ),
          onTap: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ));
  }
}
