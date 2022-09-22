import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/five_days.dart';
import 'package:weather_app/domain/entities/weather.dart';

import '../../core/utils/enum.dart';

class GetWeatherDataState extends Equatable {
  final BaseWeather? countryWeatherData;
  final RequestState countryWeatherDataState;
  final String countryWeatherDataMessage;
  final List<BaseFiveDays> nextDaysWeatherData;
  final RequestState nextDaysWeatherDataState;
  final String nextDaysWeatherDataMessage;

  GetWeatherDataState({
    this.countryWeatherData,
    this.countryWeatherDataState = RequestState.loading,
    this.countryWeatherDataMessage = '',
    this.nextDaysWeatherData = const [],
    this.nextDaysWeatherDataState = RequestState.loading,
    this.nextDaysWeatherDataMessage = '',
  });

  GetWeatherDataState copyWith({
    BaseWeather? countryWeatherData,
    RequestState? countryWeatherDataState,
    String? countryWeatherDataMessage,
    List<BaseFiveDays>? nextDaysWeatherData,
    RequestState? nextDaysWeatherDataState,
    String? nextDaysWeatherDataMessage,
  }) {
    return GetWeatherDataState(
      countryWeatherData: countryWeatherData ?? this.countryWeatherData,
      countryWeatherDataState:
          countryWeatherDataState ?? this.countryWeatherDataState,
      countryWeatherDataMessage:
          countryWeatherDataMessage ?? this.countryWeatherDataMessage,
      nextDaysWeatherData: nextDaysWeatherData ?? this.nextDaysWeatherData,
      nextDaysWeatherDataState:
          nextDaysWeatherDataState ?? this.nextDaysWeatherDataState,
      nextDaysWeatherDataMessage:
          nextDaysWeatherDataMessage ?? this.nextDaysWeatherDataMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        countryWeatherData,
        countryWeatherDataState,
        countryWeatherDataMessage,
        nextDaysWeatherData,
        nextDaysWeatherDataState,
        nextDaysWeatherDataMessage,
      ];
}
