import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network/core/core.dart';
import 'package:tv_app/screens/login_screen/login.dart';
import 'package:zig_assets/my_assets.dart';

import '../on_boarding/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  void initState() {
    bool isConfigured = _sharedPreferenceHelper.isConfigured;
    Future.delayed(const Duration(seconds: 5)).then((_) {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) =>
                isConfigured ? const LoginScreen() : const OnBoardingScreen(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZigHotelsAssets.lottie.namaste.lottie(height: 150.h, width: 150.w),
            Text(
              "ZigHotels",
              style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: 50, color: theme.zigHotelsColors.background),
            )
          ],
        ),
      ),
    );
  }
}
