import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network/network.dart';
import 'package:zig_assets/my_assets.dart';

import '../../utils/utils.dart';
import '../screens.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool isLogin = SharedPreferenceHelper(Preference()).isLoggedIn;

  @override
  void initState() {
    ref.read(internetConnectionProvider);
    Future.delayed(const Duration(seconds: 5)).then((_) {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) =>
                isLogin ? const DashboardScreen() : const LoginScreen(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                fontSize: 50,
                color: theme.zigHotelsColors.background,
              ),
            )
          ],
        ),
      ),
    );
  }
}
