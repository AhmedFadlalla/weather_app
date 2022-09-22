import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/use_case/base_use_case.dart';
import 'package:weather_app/domain/entities/five_days.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repository/base_weather_repostory.dart';

import '../../core/utils/constrant.dart';

class GetNextDaysWeatherDataUseCase extends BaseUseCase<List<BaseFiveDays>,WeatherParameter>{
  final BaseWeatherRepository baseWeatherRepository;

  GetNextDaysWeatherDataUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, List<BaseFiveDays>>> call(WeatherParameter parameter) async{
    return await baseWeatherRepository.getNextHoursWeatherData(parameter);
  }

}