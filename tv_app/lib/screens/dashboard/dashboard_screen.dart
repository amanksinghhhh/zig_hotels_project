import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:network/core/core.dart';
import 'package:network/network.dart';
import 'package:tv_app/screens/login_screen/login.dart';

import '../../utils/guest_checkout_service.dart';
import 'components/staggered_layout_widget.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  void initState() {
    super.initState();
    ref.read(checkOutProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: AppBar(
        backgroundColor: theme.zigHotelsColors.darkBlue,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Padding(
          padding: padding.symmetric(
            horizontal: Dimensions.medium,
          ),
          child: Text(
            'Welcome, ${_sharedPreferenceHelper.lastName.toString().capitalize()}',
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
                  'Room ${_sharedPreferenceHelper.roomNo}',
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
            vertical: Dimensions.smallest,
            horizontal: Dimensions.medium,
          ),
          child: StaggeredPage(
            onService1Tap: () {print("object");},
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
