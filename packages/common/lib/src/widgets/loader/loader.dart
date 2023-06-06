import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

isShowLoadingDialog(BuildContext context, bool status) {
  if (status) {
    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () => Future.value(false),
              child: const CustomProgressIndicator());
        });
  } else if (status == false) {
    Navigator.of(context).pop();
  }
}

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  CustomProgressIndicatorState createState() => CustomProgressIndicatorState();
}

class CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 200.0,
      width: 200.0,
      alignment: Alignment.center,
      child: SpinKitCircle(
        color: Theme.of(context).zigHotelsColors.teal,
        size: 70.0,
      ),
    );
  }
}
