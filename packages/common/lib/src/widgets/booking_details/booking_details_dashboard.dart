import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetailsWidget extends StatelessWidget {
  const BookingDetailsWidget({
    super.key,
    required this.daysCount,
    required this.nightTag,
    required this.checkInTag,
    required this.checkInDate,
    required this.checkOutTag,
    required this.checkOutTime,
  });

  final String daysCount;
  final String nightTag;
  final String checkInTag;
  final String checkInDate;
  final String checkOutTag;
  final String checkOutTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Container(
      padding: padding.symmetric(
        vertical: Dimensions.small,
        horizontal: Dimensions.small,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius:  BorderRadius.all(
          Radius.circular(20.r),
        ),
        border: Border.all(
          width: 1,
          color: theme.zigHotelsColors.teal,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.zigHotelsColors.teal,
                borderRadius:  BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: padding.symmetric(
                  vertical: Dimensions.medium,
                  horizontal: Dimensions.medium,
                ),
                child: ColumnTextWidget(
                  headerText: daysCount,
                  footerText: nightTag,
                  textStyle: theme.textTheme.titleLarge?.copyWith(
                    color: theme.zigHotelsColors.background,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ColumnTextWidget(
              headerText: checkInTag,
              footerText: checkInDate,
              textStyle: theme.textTheme.titleLarge?.copyWith(
                color: theme.zigHotelsColors.background,
              ),
            ),
          ),
          Expanded(
            child: ColumnTextWidget(
              headerText: checkOutTag,
              footerText: checkOutTime,
              textStyle: theme.textTheme.titleLarge?.copyWith(
                color: theme.zigHotelsColors.background,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ColumnTextWidget extends StatelessWidget {
  const ColumnTextWidget({
    super.key,
    required this.headerText,
    required this.footerText,
    this.textStyle,
  });

  final String headerText;
  final String footerText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          headerText,
          style: textStyle ??
              theme.textTheme.bodyLarge?.copyWith(
                color: theme.zigHotelsColors.background,
              ),
        ),
        const Space(Dimensions.smaller),
        Text(
          footerText,
          style: textStyle ??
              theme.textTheme.bodyLarge?.copyWith(
                color: theme.zigHotelsColors.background,
              ),
        ),
      ],
    );
  }
}
