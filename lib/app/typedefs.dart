import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fleetfi/app/exception.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

// typedef SignUpFuture<T> = Future<Either<SignUpFailure, T>>;
// typedef SomeFuture<T> = Future<fp.Either<Failure, T>>;
class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({
    required super.message,
    required super.statusCode,
  });

  APIFailure.fromException(APIException exception)
      : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}
