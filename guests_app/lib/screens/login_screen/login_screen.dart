import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegularActionButton(
            buttonText: context.l10n.login,
          ),
        ],
      ),
    );
  }
}
