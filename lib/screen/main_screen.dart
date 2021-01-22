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
          child: FutureBuilder(
              future: userDatas.getUserData(context),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserData>> snapShot) {
                return snapShot.data == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView(
                        children: snapShot.data
                            .map((UserData userData) => Padding(
                              padding: const EdgeInsets.fromLTRB(14,8,14,0),
                              child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                    mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 4,
                                                    color: Colors.white
                                                        ),
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:snapShot.data == null? Colors.white:Colors.grey
                                                        .withOpacity(0.4),
                                                    spreadRadius: 5,
                                                    blurRadius: 4,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/pic${userData.id}"
                                                        ".jpg",
                                                      ),
                                                      fit: BoxFit.cover),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:snapShot.data == null? Colors.white:Colors.grey
                                                          .withOpacity(0.4),
                                                      spreadRadius: 5,
                                                      blurRadius: 4,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(userData.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                        IconButton(
                                          icon:
                                              Icon(Icons.delete, color: Colors.red.withOpacity(0.7)),
                                          onPressed: () async {
                                            await userDatas.deleteUserData(
                                                context, userData.id.toString());
                                          },
                                        )
                                    ],
                                  ),
                                      )),
                            ))
                            .toList(),
                      );
              })),
    );
  }
}
