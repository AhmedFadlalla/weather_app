import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/utils/constrant.dart';
import 'package:weather_app/data/datasource/remote_data_source.dart';
import 'package:weather_app/domain/entities/five_days.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repository/base_weather_repostory.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDataSource;


  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, BaseWeather>> getWeatherByCityName(WeatherParameter parameter) async{
   final result=await baseRemoteDataSource.getWeatherByCountryName(parameter);

   try{
     return Right(result);
   }on ServerFailure catch(failure){
     return Left(ServerFailure(failure.message));
   }
  }

  @override
  Future<Either<Failure, List<BaseFiveDays>>> getNextHoursWeatherData(WeatherParameter parameter)async {
    final result=await baseRemoteDataSource.getNextDaysWeatherData(parameter);

    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }



}