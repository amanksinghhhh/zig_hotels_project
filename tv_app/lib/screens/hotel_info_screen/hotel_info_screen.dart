import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network/core/shared_preferences/helper.dart';
import 'package:network/core/shared_preferences/preferences.dart';
import 'package:translations/translations.dart';
import 'package:tv_app/screens/login_screen/login.dart';

class HotelInfoScreen extends StatefulWidget {
  const HotelInfoScreen({Key? key}) : super(key: key);

  @override
  State<HotelInfoScreen> createState() => _HotelInfoScreenState();
}

class _HotelInfoScreenState extends State<HotelInfoScreen> {
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
    );
  }
}
