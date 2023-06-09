import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    TempDataModel? main,
    List<GetWeatherDataModel>? weather,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class TempDataModel with _$TempDataModel {
  const factory TempDataModel({
    double? temp,
  }) = _TempDataModel;

  factory TempDataModel.fromJson(Map<String, dynamic> json) =>
      _$TempDataModelFromJson(json);
}

@freezed
class GetWeatherDataModel with _$GetWeatherDataModel {
  const factory GetWeatherDataModel({
    String? main,
    String? description,
    String? icon,
  }) = _GetWeatherDataModel;

  factory GetWeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherDataModelFromJson(json);
}
