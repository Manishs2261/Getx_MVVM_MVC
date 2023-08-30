import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm/src/data/app_exception/app_exception.dart';
import 'package:getx_mvvm/src/data/network/baseApiservices.dart';
import 'package:http/http.dart'as http;

class  NetworkApiServices extends BaseApiServices{



  @override
  Future getApi(String url) async {
    // TODO: implement getApi

    dynamic responseJson;

    try{

      final response  = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{

      throw RequestTimeOut('');
    }

    return responseJson;
  }


  //========================post api ==================

  @override
  Future postApi(data, String url) async {
    // TODO: implement postApi

    dynamic responseJson;

    try{

      final response  = await http.post(Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }


  print(responseJson.toString());
    return responseJson;
  }
  }



//================handle response status code===============
  dynamic returnResponse(http.Response response){

    switch(response.statusCode){

      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException("Error occured while communication with  server"+ response.statusCode.toString());
        }
  }




