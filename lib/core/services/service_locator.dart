
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasource/remote_data_source.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/domain/repository/base_weather_repostory.dart';
import 'package:weather_app/domain/usecase/get_weather_by_country.dart';
import 'package:weather_app/presentation/controller/get_country_weather_data_bloc.dart';

import '../../domain/usecase/get_next_days_weather_data.dart';


final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc

    sl.registerFactory(() => GetCountryWeatherDataBloc(sl(),sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case

    sl.registerLazySingleton<GetWeatherByCountryNameUseCase>(() =>GetWeatherByCountryNameUseCase(sl()));
    sl.registerLazySingleton<GetNextDaysWeatherDataUseCase>(() =>GetNextDaysWeatherDataUseCase(sl()));
    //Repository

    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(sl()));
    //data source

    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }

}