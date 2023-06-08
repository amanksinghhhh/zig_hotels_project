import 'dart:convert';

import 'package:http/http.dart';

class WeatherApi {
  String endPoint =
      'https://api.openweathermap.org/data/2.5/weather?lat=23.2207043&lon=72.6043484&appid=eecb6c5af14c87ca84ff7904d35c11d9';

  Future<double> getWeather() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      double temperature = jsonData['main']['temp'];
      double celsius = temperature - 273.15;
      return celsius;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
