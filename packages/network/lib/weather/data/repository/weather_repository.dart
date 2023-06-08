import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/weather/data/api/weather_api.dart';
import 'package:network/weather/data/model/weather_model.dart';
import '../../../core/network/dio_exceptions.dart';

class WeatherRepository {
  final WeatherApi _weatherApi;
  WeatherRepository(this._weatherApi);
  Future<WeatherModel> weatherRepo(
      Map<String, dynamic> queryParams
  ) async {
    try {
      final res = await _weatherApi.weatherApi(
        queryParams,
      );
      final responseModel = WeatherModel.fromJson(
        res,
      );
      return responseModel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(
        errorMessage.toString(),
      );
      Fluttertoast.showToast(
        msg: errorMessage.toString(),
        backgroundColor: Colors.red[50],
        gravity: ToastGravity.TOP,
        textColor: Colors.red,
      );
      rethrow;
    }
  }
}
