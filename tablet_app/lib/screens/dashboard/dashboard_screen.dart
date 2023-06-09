import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:tablet_app/screens/login_screen/login.dart';
import 'package:translations/translations.dart';
import '../../utils/utils.dart';
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
            '${context.l10n.welcome}, ${_sharedPreferenceHelper.lastName.toString().capitalize()}',
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.zigHotelsColors.background,
              fontFamily: 'Waterfall',
              fontSize: 45,
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
                  '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.zigHotelsColors.background,
                  ),
                ),
                const Space(Dimensions.medium),
                Row(
                  children: [
                    Image.network(
                      'http://openweathermap.org/img/w/${_sharedPreferenceHelper.weatherIcon}.png',
                    ),
                    const Space(Dimensions.smallest),
                    Text(
                      "${_sharedPreferenceHelper.temperature} °C",
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.zigHotelsColors.background,
                      ),
                    ),
                  ],
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
        child: SingleChildScrollView(
          child: Padding(
            padding: padding.symmetric(
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
              serviceName1: context.l10n.hotelInfo,
              serviceName2: context.l10n.roomDining,
              serviceName3: context.l10n.restaurantsAndBar,
              serviceName4: context.l10n.spa,
              serviceName5: context.l10n.whereToGo,
              serviceName6: context.l10n.roomServices,
              serviceName7: context.l10n.viewMenu,
              serviceName8: context.l10n.viewBills,
              serviceName9: context.l10n.myOrders,
              serviceName10: context.l10n.settings,
              serviceName11: context.l10n.roomControl,
              serviceName12: context.l10n.more,
            ),
          ),
        ),
      ),
    );
  }
}
