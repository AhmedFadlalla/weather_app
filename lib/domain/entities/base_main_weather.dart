import 'package:equatable/equatable.dart';

class BaseMainWeather extends Equatable{
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double  tempMax;
  final int pressure;
  final int humidity;

  BaseMainWeather(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  @override
  // TODO: implement props
  List<Object?> get props => [
    temp,feelsLike,tempMin,tempMax,pressure,humidity
  ];
}
