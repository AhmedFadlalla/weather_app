import 'package:equatable/equatable.dart';

class BaseSystemData extends Equatable {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  BaseSystemData({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];
}
