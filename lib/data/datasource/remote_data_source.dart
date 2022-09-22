import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/utils/constrant.dart';
import 'package:weather_app/data/models/five_days_data.dart';
import 'package:weather_app/data/models/whether.dart';
import 'package:weather_app/domain/entities/weather.dart';


import '../../core/network/error_message_model.dart';
import '../../core/network/error_result_model.dart';
import '../../core/utils/app_constant.dart';
import '../models/current_weather_data.dart';

abstract class BaseRemoteDataSource{
  Future<CurrentWeatherDataModel> getWeatherByCountryName(WeatherParameter parameter);
  Future<List<FiveDayModel>> getNextDaysWeatherData(WeatherParameter parameter);
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<CurrentWeatherDataModel> getWeatherByCountryName(WeatherParameter parameter) async{
   
    final response=await Dio().get(AppContances.countryWeatherData(parameter.cityName));
    if(response.statusCode==200){
      return CurrentWeatherDataModel.fromJson(response.data);
    }else{
      throw ServerException(errorResultModel: ErrorResultModel.fromJson(response.data));
    }
  }

  @override
  Future<List<FiveDayModel>> getNextDaysWeatherData(WeatherParameter parameter)async {
    final response=await Dio().get(AppContances.nextDaysWeatherData(parameter.cityName));
    if(response.statusCode==200){
      return List<FiveDayModel>.from((response.data["list"] as List)
          .map((e) => FiveDayModel.fromJson(e)));
    }else{
      throw ServerException(errorResultModel: ErrorResultModel.fromJson(response.data));
    }
  }
 
 
}