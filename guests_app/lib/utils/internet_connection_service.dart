import 'package:common/common.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final internetConnectionProvider =
StateNotifierProvider<InternetConnectionService, bool>((ref) {
  return InternetConnectionService();
});

class InternetConnectionService extends StateNotifier<bool> {
  InternetConnectionService() : super(false) {
    Connectivity().onConnectivityChanged.listen((result) {
      state = result != ConnectivityResult.none;
      _showConnectionStatus(state);
    });
  }

  void _showConnectionStatus(bool isConnected) {
    if (isConnected) {
    } else {
      Fluttertoast.showToast(
        msg: 'Internet not Available !',
        backgroundColor: Colors.red[50],
        gravity: ToastGravity.SNACKBAR,
        textColor: zigHotelsColorsExtension.error,
      );
    }
  }
}
