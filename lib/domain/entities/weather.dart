import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/base_wind.dart';

import 'base_cloud.dart';
import 'base_coord.dart';
import 'base_main_weather.dart';
import 'base_system_data.dart';
import 'base_weather.dart';

class BaseWeather extends Equatable{
  final BaseCoord coord;
  final List<BaseWeatherData> weather;
  final String base;
  final BaseMainWeather main;
  final int visibility;
  final BaseWind wind;
  final BaseCloud clouds;
  final int dt;
  final BaseSystemData sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;
   String? date;


  BaseWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
    this.date
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    coord,weather,base,main,visibility,wind,clouds,dt,sys,timezone,id,name,cod
  ];
}