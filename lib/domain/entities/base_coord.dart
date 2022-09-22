import 'package:equatable/equatable.dart';

class BaseCoord extends Equatable{
final double lon;
final double lat;


BaseCoord({
  required this.lat,
  required this.lon
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    lon,lat
  ];
}