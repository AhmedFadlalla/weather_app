import 'package:equatable/equatable.dart';

class BaseWind extends Equatable {
  final double speed;
  final int degree;

  BaseWind({
    required this.speed,
    required this.degree,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [speed,degree];
}
