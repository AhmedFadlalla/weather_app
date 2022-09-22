import 'package:equatable/equatable.dart';

abstract class GetWeatherDataEvent extends Equatable{

  GetWeatherDataEvent();

  @override
  List<Object?> get props => [];


}

class GetCountryWeatherDataEvent extends GetWeatherDataEvent{
  final String countryName;

  GetCountryWeatherDataEvent(this.countryName);
  @override
  List<Object?> get props => [countryName];
}
class GetNextDaysWeatherDataEvent extends GetWeatherDataEvent{
  final String countryName;

  GetNextDaysWeatherDataEvent(this.countryName);
  @override
  List<Object?> get props => [countryName];
}