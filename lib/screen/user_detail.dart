import 'package:api_provider_practice/models/user_data_model.dart';
import 'package:api_provider_practice/providers/user_provider.dart';
import 'package:api_provider_practice/screen/add_to_story.dart';
import 'package:api_provider_practice/screen/cover_profile.dart';
import 'package:api_provider_practice/screen/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetail extends StatelessWidget {
  int id;


  UserDetail({Key key, this.id}) : super(key: key);

  Widget _customText(String category, String text, int color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
      child: Row(
        children: [
          Text(category,
              style: TextStyle(
                  color: Color(color),
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          Flexible(
            child: Text(text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userDatafromProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ListView(
            children: [
              SizedBox(height: 30),
              FutureBuilder<UserData>(
                future: userDatafromProvider.fetchUserData(context, id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            CoverProfile(),
                            Positioned(
                                top: 130,
                                right: MediaQuery.of(context).size.width / 3.5,
                                child: ProfilePic(id: snapshot.data.id))
                          ],
                        ),
                        SizedBox(height: 80),
                        _customText("", snapshot.data.name, 0xff000000),
                        AddToStoryButton()
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
        ));
  }
}
