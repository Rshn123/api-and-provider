import 'package:api_provider_practice/constants/route_constants.dart';
import 'package:api_provider_practice/screen/main_screen.dart';
import 'package:api_provider_practice/screen/user_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouters{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _getPageRoute(viewToShow: MainScreen());
      case userDetailRoute:
        return _getPageRoute(viewToShow: UserDetail(id:settings.arguments));
    }
  }
}

PageRoute _getPageRoute({Widget viewToShow}) {
  return MaterialPageRoute(
      builder: (_) => viewToShow);
}
