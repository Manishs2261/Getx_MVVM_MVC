import 'package:get/get.dart';
import 'package:getx_mvvm/src/Repository/home_repository/homerepository.dart';
import 'package:getx_mvvm/src/data/response/status_code.dart';
import 'package:getx_mvvm/src/models/home/user_list_model.dart';

class HomeController extends GetxController{

  final _api = HomeRepository();

  final rxRequestStates = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStates.value = _value;
  void setUserList(UserListModel _value) =>  userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi(){
    _api.userListAPi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
        setError('No Internet');
      setRxRequestStatus(Status.ERROR);

    });
  }

  void reFreshApi(){
    setRxRequestStatus(Status.LOADING);

    _api.userListAPi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
      setError('No Internet');
      setRxRequestStatus(Status.ERROR);

    });
  }
}