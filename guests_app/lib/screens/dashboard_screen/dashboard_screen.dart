import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/network.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

import '../../utils/guest_checkout_service.dart';
import '../screens.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _selectedIndex = 0;
  DateTime? _lastPressedAt;

  @override
  void initState() {
    super.initState();
    ref.read(checkOutProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      const RoomControlScreen(),
      const EntertainmentScreen(),
      const MoreOptionsScreen(),
    ];
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: SnakeNavigationBar.color(
          snakeShape: SnakeShape.rectangle,
          height: 60.h,
          currentIndex: _selectedIndex,
          snakeViewColor: theme.zigHotelsColors.oceanBlue,
          backgroundColor: theme.zigHotelsColors.teal,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.home.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 26.h,
                width: 26.w,
              ),
              activeIcon: ZigHotelsAssets.images.home.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 26.h,
                width: 26.w,
              ),
              label: context.l10n.home,
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.roomControlPng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 30.h,
                width: 30.w,
              ),
              activeIcon: ZigHotelsAssets.images.roomControlPng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 30.h,
                width: 30.w,
              ),
              label: context.l10n.roomControl,
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.entertainment.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 28.h,
                width: 28.w,
              ),
              activeIcon: ZigHotelsAssets.images.entertainment.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 28.h,
                width: 28.w,
              ),
              label: context.l10n.entertainment,
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.morePng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 28.h,
                width: 28.w,
              ),
              activeIcon: ZigHotelsAssets.images.morePng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 28.h,
                width: 28.w,
              ),
              label: context.l10n.more,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) >
            const Duration(seconds: 2)) {
      // Show a toast message to the user
      Fluttertoast.showToast(
        msg: context.l10n.backAgainToExit,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.sp,
      );
      // Update the time of the last back button press
      _lastPressedAt = DateTime.now();
      // Don't exit the app yet
      return Future.value(false);
    }
    // Exit the app
    SystemNavigator.pop();
    return Future.value(true);
  }
}
