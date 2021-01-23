import 'dart:convert';
import 'dart:io';

import 'package:api_provider_practice/models/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String url = "https://jsonplaceholder.typicode.com/users";
List<UserData> _userData = List<UserData>();

Future<List<UserData>> getUserDatas(context) async {
  try {
    http.Response response = await http.get(url);
    int statusCode = response.statusCode;

    if (statusCode == 200) {
      var userData = json.decode(response.body);
      _userData =
          (userData as List).map((val) => UserData.fromJson(val)).toList();
    } else {
      print("Network Error");
    }
  } on SocketException {
    print("e");
  }
  return _userData;
}

Future deleteUser(context, String id) async {
  final http.Response response =
      await http.delete("$url/$id", headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  print(response.statusCode);

  print(response.body);
  print(id);
}

Future<UserData> getUserData(context, int id) async {
  final http.Response response =
      await http.get("$url/$id", headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  return UserData.fromJson(json.decode(response.body));
}
