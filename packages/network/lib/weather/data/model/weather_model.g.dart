// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherModel _$$_WeatherModelFromJson(Map<String, dynamic> json) =>
    _$_WeatherModel(
      main: json['main'] == null
          ? null
          : TempDataModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => GetWeatherDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherModelToJson(_$_WeatherModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
    };

_$_TempDataModel _$$_TempDataModelFromJson(Map<String, dynamic> json) =>
    _$_TempDataModel(
      temp: (json['temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TempDataModelToJson(_$_TempDataModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };

_$_GetWeatherDataModel _$$_GetWeatherDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_GetWeatherDataModel(
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_GetWeatherDataModelToJson(
        _$_GetWeatherDataModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
