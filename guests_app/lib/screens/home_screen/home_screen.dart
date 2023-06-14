import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:guests_app/screens/screens.dart';
import 'package:intl/intl.dart';
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
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 900),
              childAnimationBuilder: (widget) => SlideAnimation(
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)),
                      child: ZigHotelsAssets.images.backgroundDash.image(
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: padding.symmetric(
                        horizontal: Dimensions.medium,
                        vertical: Dimensions.larger,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${context.l10n.welcome}, ${_sharedPreferenceHelper.lastName.toString().capitalize()}',
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: theme.zigHotelsColors.background,
                              fontFamily: 'Waterfall',
                              fontSize: 40.sp,
                            ),
                          ),
                          Text(
                            '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: theme.zigHotelsColors.background,
                            ),
                          ),
                          const Space(Dimensions.largest),
                          BookingDetailsWidget(
                            daysCount:
                                _sharedPreferenceHelper.nights.toString(),
                            nightTag: context.l10n.nights,
                            checkInTag: context.l10n.checkIn,
                            checkInDate: _getFormattedDate(_sharedPreferenceHelper.checkIn ?? ""),
                            checkOutTag: context.l10n.checkOut,
                            checkOutTime:
                            _getFormattedDate(_sharedPreferenceHelper.checkOut ?? ""),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: padding.symmetric(
                    horizontal: Dimensions.medium,
                    //vertical: Dimensions.small,
                  ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                      children: [
                        Text(
                          context.l10n.quickServices,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.zigHotelsColors.background,
                          ),
                        ),
                        const Space(Dimensions.medium),
                        StaggeredPage(
                          onService1Tap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RoomServicesScreen(),
                              ),
                            );
                          },
                          onService2Tap: () {},
                          onService3Tap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    const RestaurantBarScreen(),
                              ),
                            );
                          },
                          onService4Tap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    const SpaAndMassageScreen(),
                              ),
                            );
                          },
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
        ),
      ),
    );
  }
  String _getFormattedDate(String date){
    DateTime dateTime = DateTime.parse(date);
    DateFormat outputFormat = DateFormat("dd MMM yyyy");
    String convertedDate = outputFormat.format(dateTime);
    return convertedDate;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
