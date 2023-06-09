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
  const DashboardScreen({Key? key}) : super(key: key);

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
                height: 32.h,
                width: 32.w,
              ),
              activeIcon: ZigHotelsAssets.images.home.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              label: context.l10n.home,
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.roomControlPng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              activeIcon: ZigHotelsAssets.images.roomControlPng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              label: context.l10n.roomControl,
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.entertainment.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              activeIcon: ZigHotelsAssets.images.entertainment.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              label: context.l10n.entertainment,
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.morePng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              activeIcon: ZigHotelsAssets.images.morePng.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              label: context.l10n.more,
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: theme.zigHotelsColors.teal,
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: _selectedIndex,
        //   //fixedColor:theme.zigHotelsColors.darkBlue,
        //   showUnselectedLabels: false,
        //   showSelectedLabels: true,
        //   selectedItemColor: theme.zigHotelsColors.onPrimary,
        //   selectedFontSize: 14.sp,
        //   unselectedFontSize: 14.sp,
        //   onTap: (value) async {
        //     setState(() {
        //       _selectedIndex = value;
        //     });
        //     // if (value == 2) {
        //     //   await Navigator.pushNamed(context, QrScanScreen.id);
        //     //   _selectedIndex = 0;
        //     // }
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: ZigHotelsAssets.images.home.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       activeIcon: ZigHotelsAssets.images.home.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: ZigHotelsAssets.images.roomControl.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       activeIcon: ZigHotelsAssets.images.roomControl.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       label: "Room Control",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: ZigHotelsAssets.images.entertainment.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       activeIcon: ZigHotelsAssets.images.entertainment.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       label: "Entertainment",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: ZigHotelsAssets.images.more.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       activeIcon: ZigHotelsAssets.images.more.image(
        //         color: theme.zigHotelsColors.onPrimary,
        //         height: 32.h,
        //         width: 32.w,
        //       ),
        //       label: "More",
        //     ),
        //   ],
        // ),
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
