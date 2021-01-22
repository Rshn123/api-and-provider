import 'package:api_provider_practice/providers/user_provider.dart';
import 'package:api_provider_practice/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';



void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

List<SingleChildWidget> providers =[
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider(),)
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}