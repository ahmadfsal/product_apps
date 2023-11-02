import 'package:equatable/equatable.dart';

abstract class  Failure extends Equatable {
  @override
  List<Object> get props => [];
}

//Exception that is thrown when server occurs failure
class RemoteServerFailure extends Failure {}

class LocalServiceFailure extends Failure {}

//Exception that is thrown when http request call response is not 200
class HttpRequestFailure extends Failure {}