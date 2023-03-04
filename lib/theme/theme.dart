import 'package:base_flutter/theme/colors.dart';
import 'package:base_flutter/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static AppTheme? _instance;

  static late final ThemeData _defaultThemeData;

  factory AppTheme.base(ThemeData theme) {
    if (_instance != null) return _instance!;

    _instance = AppTheme._init(theme);
    return _instance!;
  }

  AppTheme._init(ThemeData theme) {
    _defaultThemeData = theme;
  }

  ThemeData get appTheme {
    return _defaultThemeData.copyWith(
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            // Making around shape
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        primaryColor: AppColors.black,
        primaryColorDark: AppColors.black,
        primaryColorLight: AppColors.black,
        appBarTheme: appBarTheme,
        canvasColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.black),
        scaffoldBackgroundColor: AppColors.black,
        dialogTheme: dialogTheme,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        tabBarTheme: tabbarTheme,
        textTheme: textTheme);
  }

  TextTheme get textTheme {
    return ThemeData.light().textTheme.apply(
          fontFamily: 'Helvetica',
        );
  }

  TabBarTheme get tabbarTheme {
    return _defaultThemeData.tabBarTheme.copyWith(
      labelStyle: AppTextStyle.t14w700(),
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.black,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.black, width: 1.h),
        insets: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }

  DialogTheme get dialogTheme {
    return _defaultThemeData.dialogTheme.copyWith(
      backgroundColor: AppColors.black,
    );
  }

  AppBarTheme? get appBarTheme {
    return _defaultThemeData.appBarTheme.copyWith(
      backgroundColor: AppColors.white,
      centerTitle: true,
      titleTextStyle: AppTextStyle.appbar,
      elevation: 0,
      iconTheme: _defaultThemeData.iconTheme.copyWith(color: AppColors.black),
      actionsIconTheme: _defaultThemeData.iconTheme.copyWith(
        color: AppColors.black,
      ),
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          shadowColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColors.transparent;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.any((state) => state == MaterialState.disabled)) {
                return AppColors.grey;
              }
              return AppColors.primary;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColors.white;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => AppTextStyle.button,
          ),
        ),
      );

  OutlinedButtonThemeData? get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.any((state) => state == MaterialState.disabled)) {
              return const BorderSide(color: AppColors.grey);
            }
            return const BorderSide(color: AppColors.primary, width: 2);
          },
        ),
        shadowColor: MaterialStateProperty.resolveWith(
          (states) {
            return AppColors.transparent;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.any((state) => state == MaterialState.disabled)) {
              return AppColors.grey;
            }
            return AppColors.primary;
          },
        ),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.white),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.any((state) => state == MaterialState.disabled)) {
            return AppTextStyle.t14w700(AppColors.grey);
          }
          return AppTextStyle.t14w700(AppColors.primary);
        }),
      ),
    );
  }
}
