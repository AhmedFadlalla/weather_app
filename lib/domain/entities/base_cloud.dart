import 'package:equatable/equatable.dart';

class BaseCloud extends Equatable{
  final int all;

  BaseCloud({required this.all});

  @override
  // TODO: implement props
  List<Object?> get props => [all];

}