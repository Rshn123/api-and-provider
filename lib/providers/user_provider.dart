import 'package:api_provider_practice/apis/json_placeholder_api.dart';
import 'package:api_provider_practice/models/user_data_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  List<UserData> user = List<UserData>();
  bool loading = false;

  Future<List<UserData>> getUserData(context) async{
    loading = true;
    user =  await getUserDatas(context);
    loading = false;

    notifyListeners();
    return user;
  }

  deleteUserData(context, String id) async{
    loading = true;
    await deleteUser(context,id);
    loading = false;
    notifyListeners();
  }

}