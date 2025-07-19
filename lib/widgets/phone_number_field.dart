import 'package:base_flutter/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PhoneNumberField({
    Key? key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "phoneNumber",
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: BaseTextField(
                initialValue: "+84",
                readOnly: true,
                enabled: false,
                showCursor: false,
                contentPadding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 16, right: 0),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(16.0),
                  constraints: BoxConstraints(
                    maxHeight: 11.0,
                    maxWidth: 11.0,
                  ),
                  // child: SvgPicture.asset(EthoIcons.vnFlag),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: BaseTextField(
                controller: controller,
                hint: "Hint",
                keyboardType: TextInputType.phone,
                maxLength: 10,
                counterText: '',
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
