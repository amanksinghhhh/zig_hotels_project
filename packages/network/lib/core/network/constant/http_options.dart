import 'package:dio/dio.dart';
import 'package:network/core/core.dart';

class HttpOptions {
  static Map<String, dynamic> getHeader(String xAuth) {
    return {
      'x-auth': xAuth ?? '',
      'customerLoginWith': 'customer',
      'Accept': 'application/json',
      'lang':
          SharedPreferenceHelper(Preference()).languageCode == AppLocal.en.name
              ? AppLocal.en.name
              : AppLocal.ar.name,
      'Connection': 'keep-alive',
    };
  }

  static Options getOptions(Map<String, dynamic>? header) {
    return Options(
      headers: header ?? {},
      contentType: "application/json",
    );
  }

  static Options getMultipartOptions(
      Map<String, dynamic>? header, var formData) {
    return Options(
      headers: header ?? {},
      contentType: 'multipart/form-data; boundary=${formData.boundary}',
    );
  }
}
