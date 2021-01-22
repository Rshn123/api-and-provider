import 'package:api_provider_practice/models/user_data_model.dart';
import 'package:api_provider_practice/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final userDatas = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Api")),
      body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
              future: userDatas.getUserData(context),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserData>> snapShot) {
                return snapShot.data == null
                    ? CircularProgressIndicator()
                    : ListView(
                        children: snapShot.data
                            .map((UserData userData) => Card(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Name: " + userData.name),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        await userDatas.deleteUserData(
                                            context, userData.id.toString());
                                      },
                                    )
                                  ],
                                )))
                            .toList(),
                      );
              })),
    );
  }
}
