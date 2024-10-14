import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection timeout");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("Send timeout");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Receive timeout");
      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode!, error.response! );
      case DioExceptionType.cancel:
        return const ServerFailure("Cancel");
      case DioExceptionType.connectionError:
        return const ServerFailure("Connection error");
      default:
        return const ServerFailure("Unknown error");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, Response response) {
    if (statusCode == 404) {
      return const ServerFailure("Request not found");
    } else if (statusCode == 401 || statusCode == 403 || statusCode == 400) {
      return ServerFailure(response.data['error']['message']);
    } else if (statusCode == 500) {
      return const ServerFailure("Internal server error");
    }
    return const ServerFailure("Unknown error, try again later");
  }
}
