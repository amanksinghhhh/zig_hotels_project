import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network/network.dart';
import 'package:translations/translations.dart';
import 'package:tv_app/screens/hotel_info_screen/hotel_info.dart';
import 'package:tv_app/screens/login_screen/login.dart';
import 'package:tv_app/screens/room_control_screen/room_control.dart';
import 'package:zig_assets/my_assets.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: TvAppbarWidget(
          isDashboardScreen: true,
          title:
              '${context.l10n.welcome}, ${_sharedPreferenceHelper.lastName.toString().capitalize()}',
          weatherWidget: Row(
            children: [
              Image.network(
                'http://openweathermap.org/img/w/${_sharedPreferenceHelper.weatherIcon}.png',
              ),
              Text(
                "${_sharedPreferenceHelper.temperature} °C",
                style: theme.textTheme.displaySmall?.copyWith(
                  color: theme.zigHotelsColors.background,
                ),
              ),
            ],
          ),
          onWifiPressed: () async => await _onWifiInfoTap(context),
          roomInfoText:
              '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
          wifiIcon: ZigHotelsAssets.images.wifiInfo.image(
            height: 28.h,
            width: 28.w,
            color: theme.zigHotelsColors.onPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding.symmetric(
            vertical: Dimensions.smallest,
            horizontal: Dimensions.medium,
          ),
          child: StaggeredPage(
            onService1Tap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HotelInfoScreen(),
                ),
              );
            },
            onService2Tap: () {},
            onService3Tap: () {},
            onService4Tap: () {},
            onService5Tap: () {},
            onService6Tap: () {},
            onService7Tap: () {},
            onService8Tap: () {},
            onService9Tap: () {},
            onService10Tap: () {},
            onService11Tap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const RoomControlScreen(),
                ),
              );
            },
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
    );
  }

  Future<void> _onWifiInfoTap(BuildContext context) async {
    final wifiCred = await _fetchWifiInfo();
    if (mounted) {
      showAnimatedDialog(
        context,
        WifiInfoDialog(
          wifiName: wifiCred[0] ?? "",
          wifiPassword: wifiCred[1] ?? "",
          wifiInfoTag: "Wi-Fi Info",
          wifiNameTag: "Wi-Fi Name",
          wifiPassTag: "Wi-Fi Password",
          closeTag: "Close",
        ),
      );
    }
  }

  Future<List<String>> _fetchWifiInfo() async {
    final List<String> wifiCred = [];
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.wifiInfo)
        .get()
        .then((value) {
      wifiCred.addAll([
        value.docs.first.data()[FirebaseConstants.wifiName],
        value.docs.first.data()[FirebaseConstants.wifiPwd]
      ]);
    });
    return wifiCred;
  }
}
