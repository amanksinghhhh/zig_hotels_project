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

  Future<void> saveUserData(String userData) async {
    await _sharedPreference.setString(PrefKeys.userData, userData);
  }

  String? get userData {
    return _sharedPreference.getString(PrefKeys.userData);
  }

  Future<void> saveEmail(String email) async {
    await _sharedPreference.setString(PrefKeys.email, email);
  }

  String? get email {
    return _sharedPreference.getString(PrefKeys.email);
  }

  Future<void> saveFirstName(String firstName) async {
    await _sharedPreference.setString(PrefKeys.firstName, firstName);
  }

  String? get firstName {
    return _sharedPreference.getString(PrefKeys.firstName);
  }

  Future<void> saveLoginWith(String loginWith) async {
    await _sharedPreference.setString(PrefKeys.loginWith, loginWith);
  }

  String? get loginWith {
    return _sharedPreference.getString(PrefKeys.loginWith);
  }

  Future<void> saveLastName(String lastName) async {
    await _sharedPreference.setString(PrefKeys.lastName, lastName);
  }

  String? get lastName {
    return _sharedPreference.getString(PrefKeys.lastName);
  }

  Future<void> savePhoneNumber(String phoneNumber) async {
    await _sharedPreference.setString(PrefKeys.phoneNumber, phoneNumber);
  }

  String? get phoneNumber {
    return _sharedPreference.getString(PrefKeys.phoneNumber);
  }

  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> saveIsNotify(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isNotify, value);
  }

  bool get isNotify {
    return _sharedPreference.getBool(PrefKeys.isNotify) ?? false;
  }

  Future<void> saveUsherData(bool value) async {
    await _sharedPreference.setBool(PrefKeys.usherData, value);
  }

  bool get usherData {
    return _sharedPreference.getBool(PrefKeys.usherData) ?? false;
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }

  Future<void> saveNearByKm(int nearByKm) async {
    await _sharedPreference.setInt(PrefKeys.nearByKm, nearByKm);
  }

  int? get nearByKm {
    return _sharedPreference.getInt(PrefKeys.nearByKm);
  }

  Future<void> saveMapKey(String mapKey) async {
    await _sharedPreference.setString(PrefKeys.mapKey, mapKey);
  }

  String? get mapKey {
    return _sharedPreference.getString(PrefKeys.mapKey);
  }

  Future<void> saveUserLatitude(String userLatitude) async {
    await _sharedPreference.setString(PrefKeys.userLatitude, userLatitude);
  }

  String? get userLatitude {
    return _sharedPreference.getString(PrefKeys.userLatitude);
  }

  Future<void> saveUserLongitude(String userLongitude) async {
    await _sharedPreference.setString(PrefKeys.userLongitude, userLongitude);
  }

  String? get userLongitude {
    return _sharedPreference.getString(PrefKeys.userLongitude);
  }

  Future<void> saveDeviceId(String deviceId) async {
    await _sharedPreference.setString(PrefKeys.deviceId, deviceId);
  }

  String? get deviceId {
    return _sharedPreference.getString(PrefKeys.deviceId);
  }

  Future<void> saveCustomerId(String customerId) async {
    await _sharedPreference.setString(PrefKeys.customerId, customerId);
  }

  String? get customerId {
    return _sharedPreference.getString(PrefKeys.customerId);
  }

  Future<void> saveCountryIsoCode(String countryIsoCode) async {
    await _sharedPreference.setString(PrefKeys.countryIsoCode, countryIsoCode);
  }

  String? get countryIsoCode {
    if (_sharedPreference.getString(PrefKeys.countryIsoCode) == "") {
      return 'JO';
    } else {
      return _sharedPreference.getString(PrefKeys.countryIsoCode);
    }
  }

  Future<void> saveCountryCode(String countryCode) async {
    await _sharedPreference.setString(PrefKeys.countryCode, countryCode);
  }

  String? get countryCode {
    if (_sharedPreference.getString(PrefKeys.countryCode) == "") {
      return '962';
    } else {
      return _sharedPreference.getString(PrefKeys.countryCode);
    }
  }

  Future<void> saveLoggedInTime(int loggedInTime) async {
    await _sharedPreference.setInt(PrefKeys.loggedInTime, loggedInTime);
  }

  int? get loggedInTime {
    return _sharedPreference.getInt(PrefKeys.loggedInTime);
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

  Future<void> saveUserTimeZone(String userTimeZone) async {
    await _sharedPreference.setString(PrefKeys.userTimeZone, userTimeZone);
  }

  String? get userTimeZone {
    return _sharedPreference.getString(PrefKeys.userTimeZone);
  }
}

mixin PrefKeys {
  static const String isLoggedIn = "isLoggedIn";
  static const String authToken = "authToken";
  static const String userData = "userData";
  static const String email = "email";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String userId = "userId";
  static const String phoneNumber = "phoneNumber";
  static const String nearByKm = "nearByKm";
  static const String mapKey = "mapKey";
  static const String userLatitude = "userLat";
  static const String userLongitude = "userLng";
  static const String loginWith = "loginWith";
  static const String deviceId = "deviceId";
  static const String customerId = "customerId";
  static const String isNotify = 'isNotify';
  static const String usherData = 'usherData';
  static const String loggedInTime = 'loggedInTime';
  static const String languageCode = 'languageCode';
  static const String countryIsoCode = 'countryIsoCode';
  static const String countryCode = 'countryCode';
  static const String userTimeZone = 'userTimeZone';
}

enum AppLocal { en, ar }
