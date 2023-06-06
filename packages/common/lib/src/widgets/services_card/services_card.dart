import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    super.key,
    required this.items,
    required this.theme,
    required this.index,
  });

  final List items;
  final ThemeData theme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      ),
      child: Stack(
        children: [
          items[index].image,
          Container(
            height: 170.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  theme.zigHotelsColors.black.withOpacity(0.8),
                  theme.zigHotelsColors.black.withOpacity(0.2),
                  Colors.transparent
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10.h,
            child: Column(
              children: [
                Text(
                  items[index].serviceName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    color: theme.zigHotelsColors.onPrimary,
                  ),
                ),
                Text(
                  items[index].time,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.zigHotelsColors.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
