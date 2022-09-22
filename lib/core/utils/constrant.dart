import 'package:equatable/equatable.dart';

class WeatherParameter extends Equatable{
  final String cityName;


  WeatherParameter({required this.cityName});

  @override
  // TODO: implement props
  List<Object?> get props => [cityName,];

}
