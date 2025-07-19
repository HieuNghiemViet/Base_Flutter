import 'package:base_flutter/base.dart';
import 'package:flutter/services.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final dynamic title;
  final bool centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool alwaysShowBack;
  final VoidCallback? onPop;
  final bool largeTitle;
  final String? subTitle; // only support for large title now
  final bool showBottomBorder;
  final double? titleSpacing;
  final Color? backgroundColor;
  final bool? hideToolbar;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const BaseAppBar({
    Key? key,
    this.leading,
    this.title,
    this.centerTitle = true,
    this.actions,
    this.bottom,
    this.alwaysShowBack = false,
    this.onPop,
    this.largeTitle = false,
    this.subTitle,
    this.showBottomBorder = false,
    this.titleSpacing,
    this.backgroundColor,
    this.hideToolbar = false,
    this.systemOverlayStyle,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return hideToolbar == true
        ? const Size.fromHeight(0)
        : Size.fromHeight(BaseDimens.appBarHeight + bottomHeight);
  }

  double get bottomHeight {
    double height = 0;
    if (bottom != null) {
      height += bottom!.preferredSize.height;
    }
    if (largeTitle) {
      height += 30;
      if (subTitle != null) {
        height += 32;
      }
    }
    return height;
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = _foregroundColor();

    var leading = this.leading;
    if (leading == null) {
      final parentRoute = ModalRoute.of(context);
      final bool canPop = parentRoute?.canPop ?? false;
      final bool useCloseButton =
          parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
      if (canPop || alwaysShowBack) {
        leading = useCloseButton
            ? CloseButton(color: foregroundColor)
            : IconButton(
                icon: SvgPicture.asset(
                  AppIcons.back,
                  color: foregroundColor,
                ),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: onPop ?? () => Navigator.maybePop(context),
              );
      }
    }

    Widget? titleWidget;
    if (title is Widget) {
      titleWidget = title;
    } else if (title is String) {
      final style =
          largeTitle ? AppTextStyle.appbar : AppTextStyle.t16w600();
      titleWidget = Text(title, style: style.copyWith(color: foregroundColor));
    }

    PreferredSizeWidget? bottomWidget = bottom;
    if (largeTitle && titleWidget != null) {
      if (subTitle != null) {
        titleWidget = SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              titleWidget,
              const SizedBox(height: 2),
              Text(
                subTitle!,
                style: AppTextStyle.t12w400(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      }
      titleWidget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: titleWidget,
      );
      bottomWidget = PreferredSize(
        preferredSize: Size.fromHeight(bottomHeight),
        child: bottomWidget != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  titleWidget,
                  bottomWidget,
                ],
              )
            : Padding(
                padding: EdgeInsets.only(bottom: subTitle == null ? 16 : 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: titleWidget,
                ),
              ),
      );
    }

    final appBar = AppBar(
      backgroundColor: backgroundColor ?? _backgroundColor(),
      leading: leading,
      title: largeTitle ? null : titleWidget,
      titleSpacing: titleSpacing ?? 16,
      systemOverlayStyle: systemOverlayStyle,
      elevation: 0,
      actions: actions,
      centerTitle: centerTitle,
      bottom: bottomWidget,
      toolbarHeight: hideToolbar == true ? 0 : null,
    );

    return showBottomBorder
        ? Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: AppColors.primary,
                ),
              ),
            ),
            child: appBar,
          )
        : appBar;
  }

  Color _backgroundColor() {
    return AppColors.white;
  }

  Color _foregroundColor() {
    return Colors.red;
  }
}

class EthoTransparentAppBar extends BaseAppBar {
  const EthoTransparentAppBar({
    Key? key,
    dynamic title,
    bool centerTitle = true,
    List<Widget>? actions,
  }) : super(
            key: key,
            title: title,
            centerTitle: centerTitle,
            actions: actions,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ));

  @override
  Color _backgroundColor() {
    return Colors.transparent;
  }

  @override
  Color _foregroundColor() {
    return Colors.white;
  }
}
