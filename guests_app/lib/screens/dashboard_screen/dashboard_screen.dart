import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:zig_assets/my_assets.dart';
import '../screens.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      const RoomControlScreen(),
      const EntertainmentScreen(),
      const MoreOptionsScreen(),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeShape: SnakeShape.rectangle,
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
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.roomControl.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              activeIcon: ZigHotelsAssets.images.roomControl.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              label: "Room Control",
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
              label: "Entertainment",
            ),
            BottomNavigationBarItem(
              icon: ZigHotelsAssets.images.more.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              activeIcon: ZigHotelsAssets.images.more.image(
                color: theme.zigHotelsColors.onPrimary,
                height: 32.h,
                width: 32.w,
              ),
              label: "More",
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
    );
  }
}
