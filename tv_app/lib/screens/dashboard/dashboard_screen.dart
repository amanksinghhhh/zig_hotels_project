import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

import 'components/staggered_layout_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: AppBar(
        backgroundColor: theme.zigHotelsColors.darkBlue,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: padding.symmetric(
            horizontal: Dimensions.medium,
          ),
          child: Text(
            'Welcome, Aman',
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.zigHotelsColors.background,
              fontFamily: 'Waterfall',
              fontSize: 50,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: padding.symmetric(
              horizontal: Dimensions.medium,
            ),
            child: Row(
              children: [
                Text(
                  'Room 123',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.zigHotelsColors.background,
                  ),
                ),
                const Space(Dimensions.medium),
                Text(
                  "23'C",
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.zigHotelsColors.background,
                  ),
                ),
                const Space(Dimensions.medium),
                Icon(
                  Icons.info,
                  color: theme.zigHotelsColors.background,
                  size: 28,
                ),
                const Space(Dimensions.smaller),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: padding.symmetric(
            vertical: Dimensions.small,
            horizontal: Dimensions.medium,
          ),
          child: StaggeredPage(
            onService1Tap: () {},
            onService2Tap: () {},
            onService3Tap: () {},
            onService4Tap: () {},
            onService5Tap: () {},
            onService6Tap: () {},
            onService7Tap: () {},
            onService8Tap: () {},
            onService9Tap: () {},
            onService10Tap: () {},
            onService11Tap: () {},
            onService12Tap: () {},
            serviceName1: 'Hotel Info',
            serviceName2: 'Room Dining',
            serviceName3: 'Restaurants & Bars',
            serviceName4: 'Spa & Massage',
            serviceName5: 'Where to ?',
            serviceName6: 'Room Service',
            serviceName7: 'View Menu',
            serviceName8: 'View Bills',
            serviceName9: 'My Orders',
            serviceName10: 'Settings',
            serviceName11: 'Room Controls',
            serviceName12: 'More',
          ),
        ),
      ),
    );
  }
}
