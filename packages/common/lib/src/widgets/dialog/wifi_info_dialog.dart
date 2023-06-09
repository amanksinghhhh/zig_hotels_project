import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WifiInfoDialog extends StatelessWidget {
  final String wifiName;
  final String wifiPassword;
  final String wifiInfoTag;
  final String wifiNameTag;
  final String wifiPassTag;
  final String closeTag;

  WifiInfoDialog({
    required this.wifiName,
    required this.wifiPassword,
    required this.wifiInfoTag,
    required this.wifiNameTag,
    required this.wifiPassTag,
    required this.closeTag,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Text(
        wifiInfoTag,
        style: theme.textTheme.headlineMedium?.copyWith(fontSize: 25.sp),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$wifiNameTag - ",
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w200, fontSize: 18.sp),
                ),
                TextSpan(
                  text: wifiName,
                  style:
                      theme.textTheme.headlineMedium?.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          const Space(Dimensions.small),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$wifiPassTag - ",
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w200, fontSize: 18.sp),
                ),
                TextSpan(
                  text: wifiPassword,
                  style:
                      theme.textTheme.headlineMedium?.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            closeTag,
          ),
        ),
      ],
    );
  }
}
