import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogBox extends StatelessWidget {
  final BuildContext context;
  final Function() onYes;
  final String confirmBtnText;
  final String declineBtnText;
  final String? title;
  final String content;

  const DialogBox({
    super.key,
    required this.context,
    required this.onYes,
    required this.confirmBtnText,
    required this.declineBtnText,
    this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: ThemeData(),
      child: AlertDialog(
        contentPadding: EdgeInsets.all(15.w),
        insetPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 10.w,),
        title: title != null
            ? Text(
          title!,
          style: theme.textTheme.titleMedium,
        )
            : null,
        content: Text(
          content,
          style:  theme.textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              declineBtnText,
              style:  theme.textTheme.titleMedium,
            ),
          ),
          TextButton(
            onPressed: onYes,
            child: Text(
              confirmBtnText,
              style:theme.textTheme.titleMedium?.copyWith(
                  color: theme.zigHotelsColors.error
              ),
            ),
          ),
        ],
      ),
    );
  }
}