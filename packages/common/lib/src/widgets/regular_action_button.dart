import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularActionButton extends StatelessWidget {
  const RegularActionButton({
    Key? key,
    required this.buttonText,
    this.buttonColor,
    required this.onButtonTap,
     this.buttonTextColor, this.fontSize,
  }) : super(key: key);
  final double? fontSize;
  final String buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final void Function()? onButtonTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: theme.zigHotelsColors.onBackground.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(9, 9)),
          ],
          color:buttonColor?? theme.zigHotelsColors.teal,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.r,
            ),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: theme.textTheme.titleLarge
                ?.copyWith(color: buttonTextColor, fontSize: fontSize??20.sp),
          ),
        ),
      ),
    );
  }
}
