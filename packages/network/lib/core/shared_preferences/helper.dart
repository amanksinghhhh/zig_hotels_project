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

  Future<void> saveNights(int nights) async {
    await _sharedPreference.setInt(PrefKeys.nights, nights);
  }

  int? get nights {
    return _sharedPreference.getInt(PrefKeys.nights);
  }

  Future<void> saveLastName(String lastName) async {
    await _sharedPreference.setString(PrefKeys.lastName, lastName);
  }

  String? get lastName {
    return _sharedPreference.getString(PrefKeys.lastName);
  }

  Future<void> saveRoomId(String roomId) async {
    await _sharedPreference.setString(PrefKeys.roomId, roomId);
  }

  String? get roomId {
    return _sharedPreference.getString(PrefKeys.roomId);
  }


  Future<void> saveCheckIn(String checkIn) async {
    await _sharedPreference.setString(PrefKeys.checkIn, checkIn);
  }

  String? get checkIn {
    return _sharedPreference.getString(PrefKeys.checkIn);
  }

  Future<void> saveCheckOut(String checkOut) async {
    await _sharedPreference.setString(PrefKeys.checkOut, checkOut);
  }

  String? get checkOut {
    return _sharedPreference.getString(PrefKeys.checkOut);
  }


  Future<void> saveTemperature(String temperature) async {
    await _sharedPreference.setString(PrefKeys.temperature, temperature);
  }

  String? get temperature {
    return _sharedPreference.getString(PrefKeys.temperature);
  }

  Future<void> saveWeatherIcon(String weatherIcon) async {
    await _sharedPreference.setString(PrefKeys.weatherIcon, weatherIcon);
  }

  String? get weatherIcon {
    return _sharedPreference.getString(PrefKeys.weatherIcon);
  }

  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> saveIsConfigured(bool isConfigured) async {
    await _sharedPreference.setBool(PrefKeys.isConfigured, isConfigured);
  }

  bool get isConfigured {
    return _sharedPreference.getBool(PrefKeys.isConfigured) ?? false;
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
  static const String nights = "nights";
  static const String checkIn = "checkIn";
  static const String checkOut = "checkOut";
  static const String isConfigured = "isConfigured";
  static const String temperature = "temperature";
  static const String weatherIcon = "weatherIcon";
  static const String roomId = "roomId";
}

enum AppLocal { en, ar }
