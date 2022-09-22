



import '../network/error_message_model.dart';
import '../network/error_result_model.dart';

class ServerException implements Exception{
  final ErrorResultModel errorResultModel;

  ServerException({required this.errorResultModel});
}

class LocalDataBaseException implements Exception{
  final String message;

  LocalDataBaseException({required this.message});
}