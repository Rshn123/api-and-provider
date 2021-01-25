import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  int id;

  ProfilePic({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xffffffff),
              width: 5,

            ),
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/pic$id.jpg",
                ),
                fit: BoxFit.cover),
          )),
      Positioned(
          top: 95,
          right: 30,
          child: ClipOval(
            child: Material(
              color: Colors.white.withOpacity(0.7), // button color
              child: IgnorePointer(
                child: InkWell(
                  splashColor: Colors.black,
                  // inkwell color
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.camera_alt_outlined,
                          color: Colors.black, size: 20)),
                  onTap: () {},
                ),
              ),
            ),
          ))
    ]);
  }
}
