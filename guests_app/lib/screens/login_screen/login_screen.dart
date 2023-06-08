// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guests_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:guests_app/utils/utils.dart';
import 'package:network/core/core.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              left: 0,
              child: ZigHotelsAssets.images.loginBackground.image(
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: theme.zigHotelsColors.darkBlue.withOpacity(0.45),
            ),
            Padding(
              padding: padding.symmetric(horizontal: DimensionToken.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${context.l10n.welcome} !",
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: theme.zigHotelsColors.onPrimary,
                    ),
                  ),
                  Text(
                    context.l10n.loginToExperience,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.zigHotelsColors.onPrimary,
                    ),
                  ),
                  const Space(Dimensions.largest),
                  RegularTextFormField(
                    hintText: context.l10n.roomNumber,
                    controller: _roomNumberController,
                    validation: (value) =>
                        Validation().validateEmptyFields(value, "Required"),
                    numKeyboard: true,
                  ),
                  const Space(Dimensions.medium),
                  RegularTextFormField(
                    hintText: context.l10n.lastName,
                    controller: _lastNameController,
                    validation: (value) =>
                        Validation().validateEmptyFields(value, "Required"),
                  ),
                  const Space(Dimensions.largest),
                  RegularActionButton(
                    buttonText: context.l10n.login,
                    buttonColor: theme.zigHotelsColors.onPrimary,
                    onButtonTap: () => _onLoginTap(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginTap() {
    if (_formkey.currentState!.validate()) {
      _loginUser(
          _roomNumberController.text.trim(), _lastNameController.text.trim());
    }
  }

  void _loginUser(String roomNo, String lastName) async {
    isShowLoadingDialog(context, true);
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('guest_credentials')
        .where(FirebaseConstants.roomNo, isEqualTo: int.parse(roomNo))
        .where(FirebaseConstants.lastName, isEqualTo: lastName)
        .where(FirebaseConstants.isCheckOut, isEqualTo: false)
        .get();
    if (snapshot.docs.isNotEmpty) {
      final user = snapshot.docs.first;
      print('Logged in as ${user.data()}');
      _sharedPreferenceHelper.saveLastName(user.data()[FirebaseConstants.lastName]);
      _sharedPreferenceHelper.saveRoomNo(user.data()[FirebaseConstants.roomNo]);
      _sharedPreferenceHelper.saveNights(user.data()[FirebaseConstants.nights]);
      _sharedPreferenceHelper.saveCheckIn(user.data()[FirebaseConstants.checkIn]);
      _sharedPreferenceHelper.saveCheckOut(user.data()[FirebaseConstants.checkOut]);
      isShowLoadingDialog(context, false);
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
        (route) => false,
      );
    } else {
      // User not found
      isShowLoadingDialog(context, false);
      Fluttertoast.showToast(
          msg: context.l10n.invalidCredentials,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
