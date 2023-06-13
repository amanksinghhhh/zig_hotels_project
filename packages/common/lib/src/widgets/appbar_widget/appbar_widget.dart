import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidget extends StatelessWidget {
  final String? title;

  // final String? lastTitle;
  final bool? isCenterTitle;

  // final bool? showIcon;
  // final Widget? icon;
  final Widget? leadingIcon;
  final Color? backgroundColor;
  final bool? showBackIcon;
  final VoidCallbackAction? onLeadingTap;

  const AppbarWidget({
    this.backgroundColor,
    this.isCenterTitle,
    //    this.icon,
    this.title,
    Key? key,
    //    this.showIcon,
    //    this.lastTitle,
    this.showBackIcon,
    this.leadingIcon,
    this.onLeadingTap,
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
        backgroundColor: backgroundColor ?? color.darkBlue,
        leadingWidth: 50.w,
        // actions: [
        //   if (showIcon == true && icon != null)
        //     Padding(
        //       padding: EdgeInsetsOf(context).symmetric(
        //         horizontal: DimensionToken.medium,
        //       ),
        //       child: icon,
        //     ),
        //   if (showIcon == false && lastTitle != null)
        //     Padding(
        //       padding: EdgeInsetsOf(context).symmetric(
        //         horizontal: DimensionToken.medium,
        //       ),
        //       child: Text(
        //         lastTitle!,
        //         style: TextStyle(
        //           color: color.black,
        //           fontWeight: FontWeight.w700,
        //           fontSize: 16.sp,
        //         ),
        //       ),
        //     ),
        // ],
        leading: GestureDetector(
          onTap: () => onLeadingTap ?? Navigator.pop(context),
          child: Padding(
              padding: EdgeInsetsOf(context).only(
                left: DimensionToken.medium,
              ),
              child:
                  showBackIcon ?? true ? leadingIcon : const SizedBox.shrink()),
        ),
      ),
    );
  }
}
