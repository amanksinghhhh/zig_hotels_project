import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularActionButton extends StatelessWidget {
  const RegularActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.zigHotelsColors.oceanBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.r,
          ),
        ),
      ),
      child: Center(
        child: Text("Login",style: TextStyle(
          color: theme.zigHotelsColors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
