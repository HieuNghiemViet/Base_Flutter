import 'package:base_flutter/base.dart';

class BasePrimaryButton extends StatelessWidget {
  final String text;
  final String? icon;
  final bool isEnable;
  final EdgeInsets? padding;
  final double? height;
  final double radius;
  final VoidCallback? onPressed;
  final Color? tintColor;

  const BasePrimaryButton({
    Key? key,
    required this.text,
    this.icon,
    this.onPressed,
    this.isEnable = true,
    this.padding,
    this.height,
    this.radius = BaseDimens.buttonConnerRadius,
    this.tintColor,
  }) : super(key: key);

  const BasePrimaryButton.rounded({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.isEnable = true,
    this.padding,
    this.tintColor,
  })  : height = BaseDimens.buttonHeight,
        radius = BaseDimens.buttonHeight / 2;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style: AppTextStyle.t12w400(
        getTextColor(isEnable),
      ),
    );
    if (icon != null) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon!,
            color: AppColors.white,
          ),
          const SizedBox(width: 4),
          child,
        ],
      );
    }
    return SizedBox(
      width: padding != null ? null : double.infinity,
      height: height ?? BaseDimens.buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          padding: WidgetStateProperty.all(padding),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.primary;
            }
            return getColor();
          }),
        ),
        onPressed: isEnable ? onPressed : null,
        child: child,
      ),
    );
  }

  Color getColor() {
    return tintColor ?? AppColors.primary;
  }

  Color getTextColor(bool isEnabled) {
    return isEnabled ? Colors.white : Colors.yellowAccent;
  }
}

class BaseSecondaryButton extends BasePrimaryButton {
  const BaseSecondaryButton({
    Key? key,
    required String text,
    String? icon,
    VoidCallback? onPressed,
    bool isEnable = true,
    EdgeInsets? padding,
    double height = BaseDimens.buttonHeight,
    double radius = BaseDimens.buttonConnerRadius,
    Color? tintColor,
  }) : super(
            key: key,
            text: text,
            icon: icon,
            onPressed: onPressed,
            isEnable: isEnable,
            padding: padding,
            height: height,
            radius: radius,
            tintColor: tintColor);

  BaseSecondaryButton.rounded({
    Key? key,
    required String text,
    String? icon,
    VoidCallback? onPressed,
    bool isEnable = true,
    EdgeInsets? padding,
  }) : super(
          key: key,
          text: text,
          icon: icon,
          onPressed: onPressed,
          isEnable: isEnable,
          padding: padding,
          height: BaseDimens.buttonHeight,
          radius: BaseDimens.buttonHeight / 2,
        );

  @override
  Color getColor() {
    return tintColor ?? AppColors.white;
  }

  @override
  Color getTextColor(bool isEnabled) {
    return isEnabled ? AppColors.primary : AppColors.black;
  }
}

class BaseOutlinedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final String? icon;
  final Color? iconColor;
  final Color? borderColor;
  final bool isEnable;
  final EdgeInsets? padding;
  final double? height;
  final double radius;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  BaseOutlinedButton({
    Key? key,
    required this.text,
    this.textColor,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.onPressed,
    this.isEnable = true,
    this.padding,
    this.height,
    this.radius = BaseDimens.buttonConnerRadius,
    this.backgroundColor,
  }) : super(key: key);

  const BaseOutlinedButton.rounded({
    Key? key,
    required this.text,
    this.textColor,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.onPressed,
    this.isEnable = true,
    this.padding,
    this.backgroundColor,
  })  : height = BaseDimens.buttonHeight,
        radius = BaseDimens.buttonHeight / 2;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    Widget child = Text(
      text,
      style: AppTextStyle.t12w400(
        isEnable ? textColor ?? AppColors.primary : AppColors.black,
      ),
    );
    if (icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon!,
            color: iconColor ?? AppColors.primary,
          ),
          const SizedBox(width: 4),
          child,
        ],
      );
    }
    return SizedBox(
      width: padding != null ? null : double.infinity,
      height: height ?? BaseDimens.buttonHeight,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor != null
              ? WidgetStateProperty.all(backgroundColor)
              : null,
          elevation: WidgetStateProperty.all(0.0),
          padding: WidgetStateProperty.all(padding),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
          side: WidgetStateProperty.all(BorderSide(
            color:
                isEnable ? borderColor ?? AppColors.primary : AppColors.black,
            width: 1.0,
            style: BorderStyle.solid,
          )),
        ),
        onPressed: isEnable ? onPressed : null,
        child: child,
      ),
    );
  }
}

class BaseTextButton extends StatelessWidget {
  final String text;
  final String? icon;
  final TextStyle? textStyle;
  final Color? color;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const BaseTextButton({
    Key? key,
    required this.text,
    this.icon,
    this.textStyle,
    this.color,
    required this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style: textStyle ??
          AppTextStyle.t12w400(
            color ?? Colors.amber,
          ),
    );
    if (icon != null) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon!,
            color: color ?? Colors.blueAccent,
          ),
          const SizedBox(width: 4),
          child,
        ],
      );
    }
    return TextButton(
      style: TextButton.styleFrom(padding: padding),
      onPressed: onPressed,
      child: child,
    );
  }
}

class BaseIconButton extends StatelessWidget {
  final String icon;
  final double size;
  final double cornerRadius;
  final VoidCallback onPressed;

  const BaseIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.size = BaseDimens.buttonHeight,
    this.cornerRadius = BaseDimens.buttonConnerRadius,
  }) : super(key: key);

  const BaseIconButton.circle({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = BaseDimens.buttonHeight,
  }) : cornerRadius = size / 2;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius))),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.blue;
              }
              return theme.colorScheme.primary;
            })),
        onPressed: onPressed,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

class BottomButtonContainer extends StatelessWidget {
  final Widget child;

  const BottomButtonContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: child,
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CameraButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: AppColors.white, width: 2),
          shape: BoxShape.circle,
        ),
        height: 24.0,
        width: 24.0,
        child: Center(
          child: SvgPicture.asset(AppIcons.home),
        ),
      ),
    );
  }
}
