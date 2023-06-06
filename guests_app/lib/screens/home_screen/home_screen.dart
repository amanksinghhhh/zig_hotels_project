import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guests_app/screens/restaurant_bar_screen/restaurant_bar_screen.dart';
import 'package:guests_app/screens/room_services/room_services.dart';
import 'package:guests_app/screens/screens.dart';
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
                    ),
                  ),
                  const Space(Dimensions.smaller),
                  Text(
                    '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.zigHotelsColors.background,
                    ),
                  ),
                  const Space(Dimensions.larger),
                  const Space(Dimensions.larger),
                  const BookingDetailsWidget(
                    daysCount: '02',
                    nightTag: 'Nights',
                    checkInTag: 'Check In',
                    checkInDate: '02-Jun-23',
                    checkOutTag: 'Check Out',
                    checkOutTime: '05-Jun-23',
                  ),
                  const Space(Dimensions.large),
                  Padding(
                    padding: padding.symmetric(
                      vertical: Dimensions.small,
                    ),
                    child: Text(
                      'Quick Services',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.zigHotelsColors.background,
                      ),
                    ),
                  ),
                  const Space(Dimensions.small),
                  StaggeredPage(
                    onService1Tap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const RoomServicesScreen(),
                          ));
                    },
                    onService2Tap: () {},
                    onService3Tap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const RestaurantBarScreen(),
                          ));
                    },
                    onService4Tap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SpaAndMassageScreen(),
                          ));
                    },
                    onService5Tap: () {},
                    serviceName1: 'Room Services',
                    serviceName2: 'Room Dining',
                    serviceName3: 'Restaurants & Bars',
                    serviceName4: 'Spa & Massage',
                    serviceName5: 'Where to ?',
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
