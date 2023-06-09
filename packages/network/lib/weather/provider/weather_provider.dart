import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/weather/data/api/weather_api.dart';
import 'package:network/weather/data/model/weather_state.dart';
import 'package:network/weather/data/repository/weather_repository.dart';
import 'package:network/weather/provider/weather_state_provider.dart';

final weatherApiProvider = Provider<WeatherApi>((ref) {
  return WeatherApi(
    ref.read(dioClientProvider),
  );
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository(
    ref.read(weatherApiProvider),
  );
});

final weatherDataProvider =
    StateNotifierProvider<WeatherDataNotifier, WeatherState>((ref) {
  return WeatherDataNotifier(
    ref.read(weatherRepositoryProvider),
  );
});
