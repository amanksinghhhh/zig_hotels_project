import 'package:flutter/material.dart';

void showAnimatedDialog(BuildContext context, Widget widget) {
  showGeneralDialog(
    barrierLabel: "lable",
    transitionDuration: const Duration(
      milliseconds: 300,
    ),
    barrierDismissible: true,
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        ),
      ),
      child: child,
    ),
  );
}