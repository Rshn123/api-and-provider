import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToStoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mainbuttonWidth = MediaQuery.of(context).size.width - 90;
    double sidebuttonWidth =
        MediaQuery.of(context).size.width - mainbuttonWidth;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10, 5, 0),
          child: SizedBox(
            width: mainbuttonWidth,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.blue,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.add_circle, color: Colors.white),
                  SizedBox(width: 5),
                  Text("Add to Story",
                      style: TextStyle(color: Color(0xffffffff))),
                ]),
                onPressed: () {}),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
          child: SizedBox(
              width: sidebuttonWidth - 35,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.grey.shade200,
                  child: Text(
                    "...",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                onPressed: (){},
              ),
          ),
        )
      ],
    );
  }
}
