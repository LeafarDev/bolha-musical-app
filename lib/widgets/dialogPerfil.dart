import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void showCustomDialogWithImage(BuildContext context, BolhaMembro membro) {
  Dialog dialogWithImage = Dialog(
    child: Container(
      color: Color.fromRGBO(1, 41, 51, 1),
      height: 300.0,
      width: 300.0,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black12,
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(
              membro.me.displayName,
              style: TextStyle(
                  color: Colors.white,
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
                        image:
                            CachedNetworkImageProvider(membro.me.getImage())))),
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
              FlatButton(
                color: Color.fromRGBO(30, 215, 96, 1),
                child: Text('Seguir'), //`Text` to display
                onPressed: () {
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
