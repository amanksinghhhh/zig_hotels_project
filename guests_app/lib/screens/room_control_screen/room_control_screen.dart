import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:guests_app/screens/room_control_screen/components/staggered_layout_widget.dart';

class RoomControlScreen extends StatefulWidget {
  const RoomControlScreen({super.key});

  @override
  State<RoomControlScreen> createState() => _RoomControlScreenState();
}

class _RoomControlScreenState extends State<RoomControlScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: const AppbarWidget(
          title: "Room Controls",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding.symmetric(
            horizontal: Dimensions.medium,
          ),
          child: AnimationLimiter(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 700),
                childAnimationBuilder: (widget) => SlideAnimation(
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  const Space(Dimensions.smaller),
                  StaggeredPage(
                    onService1Tap: () {},
                    onService2Tap: () {},
                    onService3Tap: () {},
                    onService4Tap: () {},
                    onService5Tap: () {},
                    onService6Tap: () {},
                    serviceName1: 'Main Lights',
                    serviceName2: 'Do Not Disturb',
                    serviceName3: 'Temperature Control',
                    serviceName4: 'Make Up Room',
                    serviceName5: 'Scenes',
                    serviceName6: 'Fan Control',
                  ),
                  const Space(Dimensions.smaller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
