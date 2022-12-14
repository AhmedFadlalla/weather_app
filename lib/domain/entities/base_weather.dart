import 'package:equatable/equatable.dart';

class BaseWeatherData extends Equatable{
  final int id;
  final String main;
  final String description;
  final String icon;

  BaseWeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,main,description,icon
  ];
}
