class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._message,this._prefix]);

  @override
  String toString(){

    return '$_prefix$_message';
  }
}

class InternetException extends AppException{

  InternetException([String? message]) : super(message,'No internet');
}


class RequestTimeOut extends AppException{

  RequestTimeOut([String? message]) : super (message ,'Request Time out');
}

class ServerException extends AppException {

  ServerException([String? message]) : super (message, 'Server Exception');

}
  class InvailidUrl extends AppException{

  InvailidUrl([String? message]) : super (message ,'In Vailid url');
}

class FetchDataException extends AppException {

  FetchDataException([String? message]) : super (message, '');

}