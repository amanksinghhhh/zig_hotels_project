import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network/core/shared_preferences/helper.dart';
import 'package:network/core/shared_preferences/preferences.dart';
import 'package:translations/translations.dart';
import 'package:tv_app/screens/login_screen/login.dart';
import 'package:zig_assets/my_assets.dart';

import 'components/staggered_layout_widget.dart';

class RoomControlScreen extends StatefulWidget {
  const RoomControlScreen({Key? key}) : super(key: key);

  @override
  State<RoomControlScreen> createState() => _RoomControlScreenState();
}

class _RoomControlScreenState extends State<RoomControlScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: TvAppbarWidget(
          leadingIcon: ZigHotelsAssets.images.arrowLongLeft.svg(
            color: theme.zigHotelsColors.onPrimary,
          ),
          title:
              '${context.l10n.welcome}, ${_sharedPreferenceHelper.lastName.toString().capitalize()}',
          weatherWidget: Row(
            children: [
              Image.network(
                'http://openweathermap.org/img/w/${_sharedPreferenceHelper.weatherIcon}.png',
                color: theme.zigHotelsColors.background,
              ),
              Text(
                "${_sharedPreferenceHelper.temperature} °C",
                style: theme.textTheme.displaySmall?.copyWith(
                  color: theme.zigHotelsColors.background,
                ),
              ),
            ],
          ),
          roomInfoText:
              '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding.symmetric(
            vertical: Dimensions.small,
            horizontal: Dimensions.medium,
          ),
          child: Column(
            children: [
              Text(
                context.l10n.roomControl,
                style: theme.textTheme.displayLarge?.copyWith(
                  color: theme.zigHotelsColors.background,
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
