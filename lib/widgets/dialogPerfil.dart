import 'package:flutter/material.dart';

void showCustomDialogWithImage(BuildContext context) {
  Dialog dialogWithImage = Dialog(
    child: Container(
      height: 300.0,
      width: 300.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.teal.withOpacity(0.5)),
            child: Text(
              "Fratosile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://profile-images.scdn.co/images/userprofile/default/817641f61b9543e2a0faf1e43ab86b447bd86c1d")))),
          ),
          new Container(
            height: 1.5,
            color: Colors.grey.withOpacity(0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  "Fechar",
                ),
                color: Colors.redAccent,
                onPressed: () {
                  //Code to execute when Floating Action Button is clicked
                  //...
                },
              ),
              SizedBox(
                width: 20,
              ),
              FlatButton.icon(
                color: Color.fromRGBO(30, 215, 96, 1),
                icon: Icon(Icons.person_add), //`Icon` to display
                label: Text('Seguir'), //`Text` to display
                onPressed: () {
                  //Code to execute when Floating Action Button is clicked
                  //...
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}