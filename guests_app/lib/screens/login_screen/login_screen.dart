import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _roomNumberController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            left: 0,
            child:
                ZigHotelsAssets.images.loginBackground.image(fit: BoxFit.cover),
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
                  context.l10n.welcome,
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
                  numKeyboard: true,
                ),
                const Space(Dimensions.medium),
                RegularTextFormField(
                  hintText: context.l10n.lastName,
                  controller: _lastNameController,
                ),
                const Space(Dimensions.largest),
                RegularActionButton(
                  buttonText: context.l10n.login,
                  buttonColor: theme.zigHotelsColors.onPrimary,
                  onButtonTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
