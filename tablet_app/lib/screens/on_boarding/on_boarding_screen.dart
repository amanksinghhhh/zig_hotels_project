// ignore_for_file: use_build_context_synchronously

import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/core/core.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

import '../../utils/validator.dart';
import '../login_screen/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final TextEditingController _roomNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
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
                    validation: (value) => Validation()
                        .validateEmptyFields(value, context.l10n.required),
                    numKeyboard: true,
                  ),
                  const Space(Dimensions.largest),
                  RegularActionButton(
                    buttonText: context.l10n.configure,
                    buttonColor: theme.zigHotelsColors.onPrimary,
                    onButtonTap: () => configureAndPush(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void configureAndPush() {
    _sharedPreferenceHelper.saveIsConfigured(true);
    _sharedPreferenceHelper.saveRoomNo(int.parse(_roomNumberController.text));
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }
}
