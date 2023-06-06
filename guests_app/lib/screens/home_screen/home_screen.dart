import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:network/core/core.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

import 'components/staggered_layout_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: -3,
              child: ZigHotelsAssets.images.dashboardBackground.image(),
            ),
            Padding(
              padding: padding.symmetric(
                horizontal: Dimensions.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Space(Dimensions.medium),
                  Text(
                    '${context.l10n.welcome}, ${_sharedPreferenceHelper.lastName}',
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: theme.zigHotelsColors.background,
                      fontFamily: 'Waterfall',
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.zigHotelsColors.background,
                    ),
                  ),
                  const Space(Dimensions.larger),
                  BookingDetailsWidget(
                    daysCount: '02',
                    nightTag: context.l10n.nights,
                    checkInTag: context.l10n.checkIn,
                    checkInDate: '02-Jun-23',
                    checkOutTag: context.l10n.checkOut,
                    checkOutTime: '05-Jun-23',
                  ),
                  const Space(Dimensions.smaller),
                  Padding(
                    padding: padding.symmetric(
                      vertical: Dimensions.small,
                    ),
                    child: Text(
                      context.l10n.quickServices,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.zigHotelsColors.background,
                      ),
                    ),
                  ),
                  StaggeredPage(
                    onService1Tap: () {},
                    onService2Tap: () {},
                    onService3Tap: () {},
                    onService4Tap: () {},
                    onService5Tap: () {},
                    serviceName1: context.l10n.roomServices,
                    serviceName2: context.l10n.roomDining,
                    serviceName3: context.l10n.restaurantsBars,
                    serviceName4: context.l10n.spa,
                    serviceName5: context.l10n.whereToGo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
