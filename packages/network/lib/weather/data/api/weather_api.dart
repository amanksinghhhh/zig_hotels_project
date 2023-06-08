import 'package:network/core/network/constant/endpoints.dart';
import 'package:network/core/network/constant/http_options.dart';
import 'package:network/core/network/dio_client.dart';

class WeatherApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  WeatherApi(this._dioClient);

  Future<Map<String, dynamic>> weatherApi(
    Map<String, dynamic> requestParam,
  ) async {
    try {
      final res = await _dioClient.get(
        Endpoints.weatherBaseUrl,
        options: HttpOptions.getOptions(null),
        queryParameters: requestParam,
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
