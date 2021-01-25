import 'package:flutter/material.dart';

class CoverProfile extends StatelessWidget {
  CoverProfile({Key key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          height:200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/pic2.jpg"
              ),
              fit: BoxFit.cover
            )
          ),
        ),
        Positioned(
            top: 150,
            right: 30,
            child: ClipOval(
              child: Material(
                color: Colors.white.withOpacity(0.7), // button color
                child: InkWell(
                  splashColor: Colors.black,
                  // inkwell color
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.camera_alt_outlined ,
                          color: Colors.black, size: 20)),
                  onTap: () {},
                ),
              ),
            ))

      ]
    );
  }
}
