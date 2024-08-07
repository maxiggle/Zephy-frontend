import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class APIException extends ServerException {
  const APIException({
    required super.message,
    required super.statusCode,
  });
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message, this.statusCode = 500});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class UnknownException extends Equatable implements Exception {
  const UnknownException(String s,
      {required this.message, this.statusCode = 500});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
