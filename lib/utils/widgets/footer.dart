import 'package:base_flutter/theme/colors.dart';
import 'package:base_flutter/theme/icons.dart';
import 'package:base_flutter/utils/constants/enum.dart';
import 'package:base_flutter/utils/constants/strings.dart';
import 'package:base_flutter/utils/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  final int currentIndex;
  final Function(int) switchTap;

  const Footer(
      {super.key, required this.currentIndex, required this.switchTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => switchTap(index),
      elevation: 30,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.primary,
      selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      items: MainTab.values
          .map((tab) => BottomNavigationBarItem(
                icon: Builder(
                  builder: (context) => SvgPicture.asset(
                    tab.icon,
                    color: IconTheme.of(context).color,
                  ),
                ),
                label: tab.title,
              ))
          .toList(),
      // [
      //   _buildItem(
      //     AppIcons.icHomeOn,
      //     AppIcons.icHomeOff,
      //     RawString.home,
      //   ),
      //   _buildItem(
      //     AppIcons.icMapOn,
      //     AppIcons.icMapOff,
      //     RawString.merchandise,
      //   ),
      //   _buildItem(
      //     AppIcons.icRecordOn,
      //     AppIcons.icRecordOff,
      //     RawString.order,
      //   ),
      //   _buildItem(
      //     AppIcons.icSettingOn,
      //     AppIcons.icSettingOff,
      //     RawString.setting,
      //   ),
      // ],
    );
  }

  BottomNavigationBarItem _buildItem(
    String activeIcon,
    String icon,
    String name,
  ) {
    // ignore: prefer_function_declarations_over_variables
    final iconWidget = (iconPath) => SizedBox(
          height: 36.h,
          child: AppIcon(
            path: iconPath,
            width: 32.w,
            height: 32.h,
          ),
        );

    return BottomNavigationBarItem(
      icon: iconWidget(icon),
      activeIcon: iconWidget(activeIcon),
      label: name,
      backgroundColor: Colors.white,
    );
  }
}
