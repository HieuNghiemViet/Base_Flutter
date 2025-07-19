import 'package:base_flutter/base.dart';

class RequiredLabelText extends StatelessWidget {
  final String text;

  const RequiredLabelText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: text, style: AppTextStyle.t12w400(Colors.black)),
          TextSpan(text: ' *', style: AppTextStyle.t12w400(Colors.red)),
        ],
      ),
    );
  }
}
