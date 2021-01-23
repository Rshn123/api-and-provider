import 'package:api_provider_practice/apis/json_placeholder_api.dart';
import 'package:api_provider_practice/models/user_data_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  List<UserData> user = List<UserData>();
  Future<UserData> userData;
  bool loading = false;

  Future<List<UserData>> getUsersData(context) async{
    loading = true;
    user =  await getUserDatas(context);
    loading = false;
    notifyListeners();
    return user;
  }

  Future<UserData> fetchUserData(context, int id) async{
    loading = true;
    userData = getUserData(context, id);
    loading = false;
    return userData;
  }

}