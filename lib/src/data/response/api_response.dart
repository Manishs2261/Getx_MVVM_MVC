

import 'package:getx_mvvm/src/data/response/status_code.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);

  ApiResponse.loading():status = Status.LOADING;
  ApiResponse.completed(this.data):status = Status.COMPLETED;
  ApiResponse.errror(this.message) :status = Status.ERROR;

  @override
  String toString() {
    // TODO: implement toString
    return "Status : $status \n Message : $message \n Data : $data";
  }


}