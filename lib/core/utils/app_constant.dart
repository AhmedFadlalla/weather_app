import 'package:equatable/equatable.dart';


class AppContances{
  static const baseUrl="http://api.openweathermap.org/data/2.5";
  static const apiKey="209639472709061043ad098a26b2a3f9";

  static String countryWeatherData(String countryName)=>
      "$baseUrl/weather?q=$countryName&appid=$apiKey";

  static String nextDaysWeatherData(String countryName)=>
      "$baseUrl/forecast?q=$countryName&ctn=3&appid=$apiKey";







}

class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

String? userArea;



