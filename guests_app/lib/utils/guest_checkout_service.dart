import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guests_app/main.dart';
import 'package:network/core/core.dart';
import '../screens/screens.dart';

final checkOutProvider = StateNotifierProvider<CheckOutService, bool>((ref) {
  return CheckOutService();
});

class CheckOutService extends StateNotifier<bool> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  CheckOutService() : super(false) {
     _autoLogout();
  }

  void _autoLogout() {
    FirebaseFirestore.instance
        .collection(FirebaseConstants.guestCredentials)
        .where(FirebaseConstants.roomNo,
            isEqualTo: _sharedPreferenceHelper.roomNo)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.docs.isEmpty) {
        navigatorKey.currentState?.pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
        state = true;
      } else {
        final data = snapshot.docs.first.data();
        final lastName = data[FirebaseConstants.lastName] as String?;
        _sharedPreferenceHelper.saveLastName(lastName ?? "");
        if (lastName == null || lastName.isEmpty) {
          navigatorKey.currentState?.pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false);
          state = true;
        } else {
          state = false;
        }
      }
    });
  }
}
