import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnDone = void Function(String text);

class OTPTextField extends StatefulWidget {
  final int maxLength;
  final TextEditingController controller;
  final Color activeColor;
  final Color inactiveColor;
  final Color borderColor;
  final OnDone? onDone;
  final Function(String)? onTextChanged;
  final bool autofocus;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final double spaceBetween;
  final TextStyle activeTextStyle;
  final TextStyle disableTextStyle;

  const OTPTextField(
      {Key? key,
      this.maxLength = 6,
      required this.controller,
      this.activeColor = Colors.green,
      this.inactiveColor = Colors.transparent,
      this.borderColor = Colors.grey,
      this.onDone,
      this.onTextChanged,
      this.autofocus = true,
      this.keyboardType = TextInputType.number,
      this.focusNode,
      this.spaceBetween = 8,
      required this.activeTextStyle,
      required this.disableTextStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OTPTextFieldState();
  }
}

class OTPTextFieldState extends State<OTPTextField>
    with SingleTickerProviderStateMixin {
  String text = "";
  int currentIndex = 0;
  List<String> strList = [];
  FocusNode? focusNode;
  double? screenWidth;
  bool hasFocus = false;

  @override
  void didUpdateWidget(OTPTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    focusNode = widget.focusNode ?? focusNode;

    if (oldWidget.maxLength < widget.maxLength) {
      setState(() {
        currentIndex = text.length;
      });
      widget.controller.text = text;
      widget.controller.selection =
          TextSelection.collapsed(offset: text.length);
    } else if (oldWidget.maxLength > widget.maxLength &&
        widget.maxLength > 0 &&
        text.isNotEmpty &&
        text.length > widget.maxLength) {
      setState(() {
        text = text.substring(0, widget.maxLength);
        currentIndex = text.length;
      });
      widget.controller.text = text;
      widget.controller.selection =
          TextSelection.collapsed(offset: text.length);
    }
  }

  _calculateStrList() async {
    if (strList.length > widget.maxLength) {
      strList.length = widget.maxLength;
    }
    while (strList.length < widget.maxLength) {
      strList.add("");
    }
  }

  @override
  void initState() {
    super.initState();
    _initTextController();
    _calculateStrList();

    focusNode = widget.focusNode ?? FocusNode();
    widget.controller.addListener(_controllerListener);
    focusNode?.addListener(_focusListener);
  }

  void _focusListener() {
    if (mounted == true) {
      setState(() {
        hasFocus = focusNode?.hasFocus ?? false;
      });
    }
  }

  void _controllerListener() {
    if (mounted == true) {
      setState(() {
        _initTextController();
      });

      if (widget.onTextChanged != null) {
        widget.onTextChanged!(widget.controller.text);
      }
    }
  }

  void _initTextController() {
    strList.clear();
    if (widget.controller.text.isNotEmpty) {
      if (widget.controller.text.length > widget.maxLength) {
        throw Exception("TextEditingController length exceeded maxLength!");
      }
    }

    text = widget.controller.text;
    for (var i = 0; i < text.length; i++) {
      strList.add(text[i]);
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      // Only dispose the focus node if it's internal.  Don't dispose the passed
      // in focus node as it's owned by the parent not this child widget.
      focusNode?.dispose();
    } else {
      focusNode?.removeListener(_focusListener);
    }
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _fakeTextInput(),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (hasFocus) {
              FocusScope.of(context).requestFocus(FocusNode());
              Future.delayed(const Duration(milliseconds: 100), () {
                FocusScope.of(context!).requestFocus(focusNode);
              });
            } else {
              FocusScope.of(context).requestFocus(focusNode);
            }
          },
          child: _numberBoxRow(context),
        ),
      ],
    );
  }

  Widget _fakeTextInput() {
    var transparentBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    );
    return TextFormField(
      autofocus: widget.autofocus,
      enableInteractiveSelection: false,
      focusNode: focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.keyboardType == TextInputType.number
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      style: const TextStyle(
        height: 0.1,
        color: Colors.transparent,
      ),
      decoration: InputDecoration(
          focusedErrorBorder: transparentBorder,
          errorBorder: transparentBorder,
          disabledBorder: transparentBorder,
          enabledBorder: transparentBorder,
          focusedBorder: transparentBorder,
          counterText: null,
          counterStyle: null,
          helperStyle: const TextStyle(
            height: 0.0,
            color: Colors.transparent,
          ),
          labelStyle: const TextStyle(height: 0.1),
          fillColor: Colors.transparent,
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
      cursorColor: Colors.transparent,
      showCursor: false,
      maxLength: widget.maxLength,
      onChanged: _onTextChanged,
    );
  }

  void _onTextChanged(text) {
    if (widget.onTextChanged != null) {
      widget.onTextChanged!(text);
    }
    setState(() {
      this.text = text;
      if (text.length >= currentIndex) {
        for (int i = currentIndex; i < text.length; i++) {
          strList[i] = text[i];
        }
      }
      currentIndex = text.length;
    });
    if (text.length == widget.maxLength) {
      FocusScope.of(context).requestFocus(FocusNode());
      widget.onDone?.call(text);
    }
  }

  Widget _numberBoxRow(BuildContext context) {
    _calculateStrList();
    List<Widget> numberWidget = List.generate(widget.maxLength, (int i) {
      return _buildNumberWidget(i, context);
    });
    return Wrap(
        direction: Axis.horizontal,
        verticalDirection: VerticalDirection.down,
        children: numberWidget);
  }

  Widget _buildNumberWidget(int i, BuildContext context) {
    var padding = widget.spaceBetween;
    if (i == 0 || i % 2 != 0 || i == widget.maxLength) {
      padding = 0;
    }
    if (text.length > i) {
      // has value
      return Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text(
            strList[i],
            style: widget.activeTextStyle,
          ));
    } else {
      // empty value => show 0 number
      return Padding(
        padding: EdgeInsets.only(left: padding),
        child: Text(
          "0",
          style: widget.disableTextStyle,
        ),
      );
    }
  }
}
