import 'package:api_provider_practice/models/user_data_model.dart';
import 'package:api_provider_practice/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetail extends StatelessWidget {
  int id;

  UserDetail({Key key, this.id}) : super(key: key);

  Widget _customText(String category, String text , int color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category,
            style: TextStyle(
                color: Color(color),
                fontWeight: FontWeight.bold, fontSize: 14)),
        Flexible(
          child: Text(text,
              style: TextStyle(
                  color: Color(color).withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final userDatafromProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                SizedBox(height: 30),
                FutureBuilder<UserData>(
                  future: userDatafromProvider.fetchUserData(context, id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/pic${snapshot.data.id}.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                        spreadRadius: 5)
                                  ])),
                          SizedBox(height: 20),
                          _customText("Name: ", snapshot.data.name, 0xff000000),
                          _customText("Username: ", snapshot.data.username,0xff000000),
                          _customText("Email: ", snapshot.data.email,0xff000000),
                          // SizedBox(height: 20),
                          // Text("Address: ",
                          //     style: TextStyle(
                          //         color: Color(0xff808080),
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 22)),
                          // _customText("Street: ", snapshot.data.address.street, 0xff808080),
                          // _customText("Suite: ", snapshot.data.address.suite,0xff808080),
                          // _customText("City: ", snapshot.data.address.city,0xff808080),
                          // _customText("Zipcode: ", snapshot.data.address.zipcode,0xff808080),
                          // _customText("Street: ", snapshot.data.address.street,0xff808080),
                          //
                          // SizedBox(height: 20),
                          //
                          // Text("Geo: ",
                          //     style: TextStyle(
                          //         color: Color(0xff666666),
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 22)),
                          // _customText("Lat: ", snapshot.data.address.geo.lat,0xff666666),
                          // _customText("Lng: ", snapshot.data.address.geo.lng,0xff666666),
                          //
                          // SizedBox(height: 20),
                          //
                          // _customText("Phone: ", snapshot.data.phone,0xff000000),
                          // _customText("Website: ", snapshot.data.website,0xff000000),
                          //
                          // SizedBox(height: 20),
                          //
                          // Text("Company: ",
                          //     style: TextStyle(
                          //         color: Color(0xff404040),
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 22)),
                          _customText("Company Name: ", snapshot.data.company.name,0xff404040),
                          // _customText("Catch Phrase: ", snapshot.data.company.catchPhrase,0xff404040),
                          // _customText("BS: ", snapshot.data.company.bs,0xff404040),

                          SizedBox(height: 20),



                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
