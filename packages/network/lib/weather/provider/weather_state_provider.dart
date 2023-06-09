import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/weather/data/model/weather_state.dart';
import 'package:network/weather/data/repository/weather_repository.dart';


class WeatherDataNotifier extends StateNotifier<WeatherState> {
  WeatherDataNotifier(this.weatherRepository) : super(WeatherState());

  WeatherRepository weatherRepository;

  Future<void> getWeather(
      Map<String, dynamic> queryParams
      ) async {
    state = state.copyWith(isLoading: true);
    await weatherRepository
        .weatherRepo(
      queryParams,
    )
        .then((data) {
      state = state.copyWith(
        weatherModel: data,
        isLoading: false,
      );
    }).onError((error, stackTrace) {
    });
  }
}
