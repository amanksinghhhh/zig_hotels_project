import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/weather/data/model/weather_model.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState{
  factory WeatherState({
    @Default(WeatherModel()) WeatherModel weatherModel,
    @Default(true) bool isLoading,
  }) = _WeatherState;
}
