// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/core.dart';
import 'package:zig_assets/my_assets.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());
  bool _isCheckedIn = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: Stack(
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
                    'ZigHotel',
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: theme.zigHotelsColors.background,
                      fontSize: 45,
                    ),
                  ),
                  subtitle: Text(
                    'Your Comfort, Our Commitment',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.zigHotelsColors.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      Text(
                        'Room ${_sharedPreferenceHelper.roomNo}',
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: theme.zigHotelsColors.background,
                        ),
                      ),
                      const Space(Dimensions.large),
                      Text(
                        "23'C",
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: theme.zigHotelsColors.background,
                        ),
                      ),
                      const Space(Dimensions.large),
                      Icon(
                        Icons.info,
                        color: theme.zigHotelsColors.background,
                        size: 28,
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
                  'Welcome,',
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: theme.zigHotelsColors.background,
                    fontFamily: 'Waterfall',
                    fontSize: 115,
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _autoLogin(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    }
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      if (data!.size > 0) {
                        _sharedPreferenceHelper.saveLastName(
                            data.docs.first.get(FirebaseConstants.lastName));
                        return data.docs.first
                                    .get(FirebaseConstants.lastName) ==
                                ""
                            ? _checkInError()
                            : Text(
                                data.docs.first.get(FirebaseConstants.lastName),
                                style: theme.textTheme.displayLarge?.copyWith(
                                  color: theme.zigHotelsColors.background,
                                  fontSize: 65.sp,
                                ),
                              );
                      }
                    }
                    return _checkInError();
                  },
                ),
                const Space(Dimensions.medium),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: OutlinedButton(
                    onPressed: () {
                      _isCheckedIn
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const Dashboard(),
                              ),
                              (route) => false)
                          : Fluttertoast.showToast(msg: 'Not Checked In !');
                    },
                    child: Padding(
                      padding: padding.symmetric(
                        horizontal: Dimensions.largest,
                        vertical: Dimensions.medium,
                      ),
                      child: Text(
                        'Continue',
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
        ],
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _autoLogin() {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.guestCredentials)
        .where(FirebaseConstants.roomNo,
            isEqualTo: _sharedPreferenceHelper.roomNo)
        .snapshots();
  }

  Widget _checkInError() {
    _isCheckedIn = false;
    return const SizedBox.shrink();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
