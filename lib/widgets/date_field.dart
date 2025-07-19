import 'package:base_flutter/base.dart';
import 'package:flutter/cupertino.dart';

class BaseDateField extends StatefulWidget {
  final DateEditingController? controller;
  final String? label;
  final String? hint;
  final DateTime? date;
  final DateTime? maxDate;
  final CupertinoDatePickerMode mode;
  final Function(DateTime)? onChanged;
  final FormFieldValidator<String>? validator;
  final String? dateFormat;
  final bool isEnabled;

  const BaseDateField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.date,
    this.onChanged,
    this.mode = CupertinoDatePickerMode.date,
    this.validator,
    this.maxDate,
    this.dateFormat,
    this.isEnabled = true,
  });

  @override
  _BaseDateFieldState createState() => _BaseDateFieldState();
}

class _BaseDateFieldState extends State<BaseDateField> {
  final _textController = TextEditingController();
  late DateEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(BaseDateField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initController();
  }

  _initController() {
    if (widget.controller != null) {
      _dateController = widget.controller!;
    } else {
      _dateController = DateEditingController();
      _dateController.value = widget.date;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _updateText();
    return Opacity(
      opacity: widget.isEnabled ? 1 : 0.5,
      child: BaseTextField(
        controller: _textController,
        label: widget.label,
        hint: widget.hint,
        readOnly: true,
        showCursor: false,
        suffixIcon: SvgPicture.asset(widget.mode == CupertinoDatePickerMode.time
            ? AppIcons.time
            : AppIcons.calendar),
        validator: widget.validator,
        onTap: widget.isEnabled ? _showPicker : null,
      ),
    );
  }

  _updateText() {
    if (widget.mode == CupertinoDatePickerMode.time) {
      _textController.text = formatDate(_dateController.value,
          widget.dateFormat ?? Constant.yyyyMMdd);
    } else {
      _textController.text = formatDate(_dateController.value,
          widget.dateFormat ?? 'dd/MM/yyyy');
    }
  }

  _showPicker() async {
    DateTime? selectedDate;
    final result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseTextButton(
                      text: "Cancel",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    BaseTextButton(
                      text: "Done",
                      onPressed: () {
                        Navigator.of(context)
                            .pop(selectedDate ?? DateTime.now());
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: _dateController.value,
                    onDateTimeChanged: (DateTime date) {
                      selectedDate = date;
                    },
                    use24hFormat: true,
                    maximumDate: widget.maxDate,
                    mode: widget.mode,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (result is DateTime) {
      _dateController.value = result;
      widget.onChanged?.call(result);
      _updateText();
    }
  }
}

class DateEditingController extends ValueNotifier<DateTime?> {
  DateEditingController({DateTime? date}) : super(date);
}
