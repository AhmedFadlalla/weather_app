import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/src/response.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/muduls/home_screen/cubit/state.dart';
import 'package:weather_app/shared/network/remote/dio.dart';
import 'package:weather_app/shared/network/endpoints.dart';
import 'package:http/http.dart' as http;



class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit():super(WeatherInitialState());


  static WeatherCubit get(context)=>BlocProvider.of(context);


  CurrentWeatherData? data;
  void getWeatherData({String? city}){

        DioHelper.getData(url: METHOD, query: {
          "q":city??"cairo",
          "appid":"209639472709061043ad098a26b2a3f9"
        }).then((value) {
          if (kDebugMode) {
            print(value.data);
          }
          data=CurrentWeatherData.fromJson(value.data);
          emit(GetWeatherDataSuccessState());
        }).catchError((error){
          if (kDebugMode) {
            print(error.toString());
          }
          emit(GetWeatherDataErrorState(error.toString()));
        }) ;

  }

  String? city;
  Future<Map<String,dynamic>> getWeatherDataWithHttp({city})async{

    city ?? (city="cairo");
    var response=await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=209639472709061043ad098a26b2a3f9')
    );

    if (kDebugMode) {
      print(jsonDecode(response.body));
    }


    return jsonDecode(response.body);

  }




}