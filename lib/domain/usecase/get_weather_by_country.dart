import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/use_case/base_use_case.dart';
import 'package:weather_app/core/utils/constrant.dart';
import 'package:weather_app/domain/repository/base_weather_repostory.dart';

import '../../domain/entities/weather.dart';

class GetWeatherByCountryNameUseCase extends BaseUseCase<BaseWeather,WeatherParameter>{

  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCountryNameUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, BaseWeather>> call(WeatherParameter parameter)async {
    return await baseWeatherRepository.getWeatherByCityName(parameter);
  }


}