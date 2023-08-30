import 'package:getx_mvvm/src/models/home/user_list_model.dart';

import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class HomeRepository{

  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListAPi() async{
    dynamic response = await _apiServices.getApi( AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}