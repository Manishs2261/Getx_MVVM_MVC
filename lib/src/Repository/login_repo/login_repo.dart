import 'package:getx_mvvm/src/data/network/network_api_services.dart';
import 'package:getx_mvvm/src/res/app_url/app_url.dart';

class LoginRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> loginAPi(var data) async{
    dynamic response = _apiServices.postApi(data, AppUrl.loginurl);
    return response;
  }
}