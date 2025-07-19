
import 'package:base_flutter/base.dart';

class EmptyWidget extends StatelessWidget {
  final dynamic icon;
  final String? message;
  final String? hint;
  final Color? background;

  const EmptyWidget({
    Key? key,
    this.icon,
    this.message,
    this.hint,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      alignment: const Alignment(0, -0.75),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon is String ? SvgPicture.asset(icon!) : icon,
          const SizedBox(height: 8),
          Text(
            message ?? "No Data Available",
            style: AppTextStyle.t12w500(),
          ),
          const SizedBox(height: 8),
          if (hint != null)
            Text(
              hint!,
              style: AppTextStyle.t12w500(),
            )
        ],
      ),
    );
  }
}
