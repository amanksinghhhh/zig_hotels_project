// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_install_app/flutter_install_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/network.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

import '../dashboard/dashboard_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());
  bool _isCheckedIn = true;
  bool downloading = true;
  double downloadProgress = 0.0;
  String? _weatherIcon;
  String? _tempCelsius;

  void fetchTemperature() async {
    await ref.read(weatherDataProvider.notifier).getWeather({
      "lat": 23.17411,
      "lon": 72.6192025,
      "appid": "eecb6c5af14c87ca84ff7904d35c11d9"
    });
    double? temperature =
        ref.watch(weatherDataProvider).weatherModel.main?.temp;
    _tempCelsius = (temperature! - 273.15).toStringAsFixed(0);
    _sharedPreferenceHelper.saveTemperature(_tempCelsius ?? "");
    _weatherIcon =
        ref.watch(weatherDataProvider).weatherModel.weather?.first.icon;
    _sharedPreferenceHelper.saveWeatherIcon(_weatherIcon ?? "");
    setState(() {});
  }

  @override
  void initState() {
    _fetchWifiInfo();
    Future.delayed(const Duration(microseconds: 1)).then((_) {
      fetchTemperature();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // Disable the back button press
          return false;
        },
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              left: 0,
              child: ZigHotelsAssets.images.loginBack.image(
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: theme.zigHotelsColors.darkBlue.withOpacity(0.65),
            ),
            Column(
              children: [
                AppBar(
                  toolbarHeight: 100,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  titleSpacing: 30,
                  title: ListTile(
                    title: Text(
                      context.l10n.app_title,
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: theme.zigHotelsColors.background,
                        fontSize: 30,
                      ),
                    ),
                    subtitle: Text(
                      context.l10n.slogan,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.zigHotelsColors.background,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      children: [
                        Text(
                          '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                          ),
                        ),
                        const Space(Dimensions.large),
                        (_tempCelsius == null)
                            ? const SizedBox.shrink()
                            : Row(
                                children: [
                                  Image.network(
                                    'http://openweathermap.org/img/w/$_weatherIcon.png',
                                  ),
                                  Text(
                                    "$_tempCelsius °C",
                                    style:
                                        theme.textTheme.displayLarge?.copyWith(
                                      color: theme.zigHotelsColors.background,
                                    ),
                                  ),
                                ],
                              ),
                        const Space(Dimensions.large),
                        InkWell(
                          focusColor: theme.zigHotelsColors.oceanBlue,
                          onTap: () async => await _onWifiInfoTap(context),
                          child: ZigHotelsAssets.images.wifiInfo.image(
                            height: 28.h,
                            width: 28.w,
                            color: theme.zigHotelsColors.onPrimary,
                          ),
                        ),
                        const Space(Dimensions.medium),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${context.l10n.welcome},",
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: theme.zigHotelsColors.background,
                      fontFamily: 'Waterfall',
                      fontSize: 100,
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _autoLogin(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text(context.l10n.somethingWentWrong);
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      }
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        if (data!.size > 0) {
                          _isCheckedIn = true;
                          _sharedPreferenceHelper.saveLastName(
                              data.docs.first.get(FirebaseConstants.lastName));
                          return data.docs.first
                                          .get(FirebaseConstants.lastName) ==
                                      "" ||
                                  data.docs.first
                                          .get(FirebaseConstants.isCheckOut) ==
                                      true
                              ? _checkInError(theme)
                              : Text(
                                  data.docs.first
                                      .get(FirebaseConstants.lastName)
                                      .toString()
                                      .capitalize(),
                                  style: theme.textTheme.displayLarge?.copyWith(
                                    color: theme.zigHotelsColors.background,
                                    fontSize: 45.sp,
                                  ),
                                );
                        }
                      }
                      return _checkInError(theme);
                    },
                  ),
                  const Space(Dimensions.medium),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: OutlinedButton(
                      onPressed: () => _onContinue(context),
                      child: Padding(
                        padding: padding.symmetric(
                          horizontal: Dimensions.largest,
                          vertical: Dimensions.medium,
                        ),
                        child: Text(
                          context.l10n.continueAction,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.zigHotelsColors.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => UpdateAppScreen(),
                  //   ),
                  // );
                  downloadFile(context,
                      'https://firebasestorage.googleapis.com/v0/b/zighotels.appspot.com/o/app%2Fapp-release.apk?alt=media&token=4d35f24f-c8a3-4ff2-a49f-c97178051e0b');

                  if (downloading) {
                    getProgress(context, downloadProgress);
                  }
                },
                child: Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  downloadFile(BuildContext context, String fileUrl) async {
    FileDownloader.downloadFile(
        url: fileUrl,
        name: 'tv_updated.apk',
        onProgress: (String? value, progress) {
          setState(() {
            downloadProgress = progress;
          });
          if (progress == 100.0) {
            downloading = false;
            Navigator.pop(context);
          }
          // setState(() {});
          // print(" asdasds dfsdffddsf : $value && $progress");
        },
        onDownloadCompleted: (String path) {
          AppInstaller.installApk(path);
        },
        onDownloadError: (String error) {
          print('DOWNLOAD ERROR: $error');
        });
  }

  Future<dynamic> getProgress(BuildContext context, double progress) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 10.0,
        percent: progress / 100,
        center: Text(
          '$progress%',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).zigHotelsColors.onPrimary,
              ),
        ),
        progressColor: Colors.blue,
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

  void _onContinue(BuildContext context) {
    _isCheckedIn
        ? Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Dashboard(),
            ),
          )
        : Fluttertoast.showToast(
            msg: context.l10n.notCheckedIn,
          );
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

  Stream<QuerySnapshot<Map<String, dynamic>>> _autoLogin() {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.guestCredentials)
        .where(FirebaseConstants.roomNo,
            isEqualTo: _sharedPreferenceHelper.roomNo)
        .snapshots();
  }

  Widget _checkInError(ThemeData theme) {
    _isCheckedIn = false;
    return Text(
      'Guest',
      style: theme.textTheme.displayLarge?.copyWith(
        color: theme.zigHotelsColors.background,
        fontSize: 45.sp,
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
