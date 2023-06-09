import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.onCardTap,
    required this.serviceName,
    this.textStyle,
  });

  final Widget image;
  final VoidCallback onCardTap;
  final String serviceName;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      focusColor: theme.zigHotelsColors.teal,
      onTap: onCardTap,
      child: Card(
        elevation: 20,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: image,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    theme.zigHotelsColors.onBackground.withOpacity(.68),
                    theme.zigHotelsColors.onBackground.withOpacity(.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5.h,
              left: 5.w,
              child: Text(
                serviceName,
                style: textStyle ??
                    theme.textTheme.headlineMedium?.copyWith(
                      color: theme.zigHotelsColors.background,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
