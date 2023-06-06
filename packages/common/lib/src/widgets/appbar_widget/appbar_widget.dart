import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidget extends StatelessWidget {
  final String? title;
  final String? lastTitle;
  final bool? isCenterTitle;
  final bool? showIcon;
  final Widget? icon;
  final Widget? backIcon;
  final Color? backgroundColor;
  final VoidCallback? onBackButtonPressed;
  final bool? showBackIcon;

  const AppbarWidget({
    this.backgroundColor,
    this.isCenterTitle,
    this.icon,
    this.title,
    this.onBackButtonPressed,
    Key? key,
    this.showIcon,
    this.lastTitle,
    this.showBackIcon,
    required this.backIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).zigHotelsColors;
    return PreferredSize(
      preferredSize: Size.infinite,
      child: AppBar(
        centerTitle: isCenterTitle ?? true,
        title: Text(
          title ?? '',
          style: TextStyle(
            color: color.onPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: backgroundColor ?? color.onPrimary,
        leadingWidth: 50.w,
        actions: [
          if (showIcon == true && icon != null)
            Padding(
              padding: EdgeInsetsOf(context).symmetric(
                horizontal: DimensionToken.medium,
              ),
              child: icon,
            ),
          if (showIcon == false && lastTitle != null)
            Padding(
              padding: EdgeInsetsOf(context).symmetric(
                horizontal: DimensionToken.medium,
              ),
              child: Text(
                lastTitle!,
                style: TextStyle(
                  color: color.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
        ],
        leading: GestureDetector(
          onTap: () => onBackButtonPressed!(),
          child: Padding(
              padding: EdgeInsetsOf(context).only(
                left: DimensionToken.medium,
              ),
              child: showBackIcon ?? true
                  ? backIcon
                  : const SizedBox.shrink()),
        ),
      ),
    );
  }
}
