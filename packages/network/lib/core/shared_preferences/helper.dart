import 'dart:async';

import 'package:network/core/shared_preferences/preferences.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference;

  const SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreference.setString(PrefKeys.authToken, authToken);
  }

  String? get authToken {
    return _sharedPreference.getString(PrefKeys.authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(PrefKeys.authToken);
  }

  Future<void> saveUserId(String userId) async {
    await _sharedPreference.setString(PrefKeys.userId, userId);
  }

  String? get userId {
    return _sharedPreference.getString(PrefKeys.userId);
  }

  Future<void> saveRoomNo(int roomNo) async {
    await _sharedPreference.setInt(PrefKeys.roomNo, roomNo);
  }

  int? get roomNo {
    return _sharedPreference.getInt(PrefKeys.roomNo);
  }

  Future<void> saveLastName(String lastName) async {
    await _sharedPreference.setString(PrefKeys.lastName, lastName);
  }

  String? get lastName {
    return _sharedPreference.getString(PrefKeys.lastName);
  }


  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }

  Future<void> saveLanguageCode(String langCode) async {
    switch (langCode) {
      case 'ar':
        await _sharedPreference.setString(
            PrefKeys.languageCode, AppLocal.ar.name);
        break;
      case 'en':
        await _sharedPreference.setString(
            PrefKeys.languageCode, AppLocal.en.name);
        break;
      default:
        await _sharedPreference.setString(
            PrefKeys.languageCode, AppLocal.ar.name);
    }
  }

  String get languageCode {
    final langCode = _sharedPreference.getString(PrefKeys.languageCode);
    switch (langCode) {
      case "en":
        return AppLocal.en.name;
      case "ar":
        return AppLocal.ar.name;
      default:
        return AppLocal.ar.name;
    }
  }

}

mixin PrefKeys {
  static const String isLoggedIn = "isLoggedIn";
  static const String authToken = "authToken";
  static const String lastName = "lastName";
  static const String userId = "userId";
  static const String languageCode = 'languageCode';
  static const String roomNo = "roomNo";
}

enum AppLocal { en, ar }
