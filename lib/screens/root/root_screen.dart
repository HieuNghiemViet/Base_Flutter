import 'package:base_flutter/routes/routes.dart';
import 'package:base_flutter/utils/widgets/footer.dart';
import 'package:base_flutter/widgets/keep_alive_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'root_controller.dart';

final GlobalKey<NavigatorState> homeNavigator = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> mapNavigator = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> recordNavigator = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> settingNavigator = GlobalKey<NavigatorState>();

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final controller = Get.put(RootController());

  late TabController _tabController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  static Future<bool> _onWillPopScope(
    GlobalKey<NavigatorState> globalKey,
  ) async {
    return !await globalKey.currentState!.maybePop();
  }

  static Widget _buildNavigatorWidget(
    GlobalKey<NavigatorState> globalKey,
    String initRoute,
  ) {
    return KeepAlivePage(
      child: WillPopScope(
        onWillPop: () => _onWillPopScope(globalKey),
        child: Navigator(
          key: globalKey,
          initialRoute: initRoute,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }

  final pages = [
    _buildNavigatorWidget(homeNavigator, RouteName.home),
    _buildNavigatorWidget(mapNavigator, RouteName.map),
    _buildNavigatorWidget(recordNavigator, RouteName.record),
    _buildNavigatorWidget(settingNavigator, RouteName.setting),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: pages,
      ),
      bottomNavigationBar: Footer(
        currentIndex: _tabController.index,
        switchTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
      ),
    );
  }

// Future<void> switchTab(int index) async {
//   setState(() {
//     switch (index) {
//       case 0:
//         homeNavigator.currentState
//             ?.popUntil(ModalRoute.withName(RouteName.home));
//         break;
//       case 1:
//         mapNavigator.currentState
//             ?.popUntil(ModalRoute.withName(RouteName.map));
//         break;
//       case 2:
//         recordNavigator.currentState
//             ?.popUntil(ModalRoute.withName(RouteName.record));
//         break;
//       case 3:
//         settingNavigator.currentState
//             ?.popUntil(ModalRoute.withName(RouteName.setting));
//         break;
//     }
//     controller.selectedIndex.value = index;
//     controller.pageController.jumpToPage(index);
//   });
// }
}
