import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/utils/constrant.dart';
import 'package:weather_app/domain/entities/five_days.dart';

import '../../domain/entities/weather.dart';

abstract class BaseWeatherRepository{
 Future<Either<Failure,BaseWeather>> getWeatherByCityName(WeatherParameter parameter);
 Future<Either<Failure,List<BaseFiveDays>>> getNextHoursWeatherData(WeatherParameter parameter);
}