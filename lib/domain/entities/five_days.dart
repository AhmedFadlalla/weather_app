import 'package:equatable/equatable.dart';

class BaseFiveDays extends Equatable{
  final int temp;
  final String date;

  BaseFiveDays({required this.temp,required this.date});

  @override
  // TODO: implement props
  List<Object?> get props => [temp,date];


}