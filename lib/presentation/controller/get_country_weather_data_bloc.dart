import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/utils/constrant.dart';
import 'package:weather_app/presentation/controller/get_country_weather_data_state.dart';

import '../../core/utils/enum.dart';
import '../../domain/usecase/get_next_days_weather_data.dart';
import '../../domain/usecase/get_weather_by_country.dart';
import 'get_country_weather_data_event.dart';


class GetCountryWeatherDataBloc extends Bloc<GetWeatherDataEvent, GetWeatherDataState> {

  final GetWeatherByCountryNameUseCase getWeatherByCountryNameUseCase;
  final GetNextDaysWeatherDataUseCase getNextDaysWeatherDataUseCase;

  GetCountryWeatherDataBloc(this.getWeatherByCountryNameUseCase,this.getNextDaysWeatherDataUseCase)
      : super(GetWeatherDataState()) {
    on<GetCountryWeatherDataEvent>((event, emit)async {
      final result=await  getWeatherByCountryNameUseCase(WeatherParameter(cityName: event.countryName));
      result.fold((l) => emit(
        state.copyWith(
          countryWeatherDataState:RequestState.error,
          countryWeatherDataMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          countryWeatherDataState: RequestState.loaded,
          countryWeatherData: r
        )
      ));
    });

    on<GetNextDaysWeatherDataEvent>((event, emit) async{
      final result=await getNextDaysWeatherDataUseCase(WeatherParameter(cityName: event.countryName));
      result.fold((l) => emit(
        state.copyWith(
          nextDaysWeatherDataMessage: l.message,
          nextDaysWeatherDataState: RequestState.error
        )
      ),
              (r) => emit(
                state.copyWith(
                  nextDaysWeatherData: r,
                  nextDaysWeatherDataState: RequestState.loaded
                )
              ));
    });
  }

}
