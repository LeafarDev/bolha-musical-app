import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showCustomDialogWithImage(BuildContext context, BolhaMembro membro) {
  var seguindo = UsersApi.following(membro.me.id);
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
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                width: 20,
              ),
              if (membro.me.id != store.state.me.id)
                FlatButton(
                  color: Color.fromRGBO(30, 215, 96, 1),
                  child: seguindo == true
                      ? Text('Deixar de Seguir')
                      : Text('Seguir'), //`Text` to display
                  onPressed: () async {
                    if (seguindo == true) {
                      var result = await UsersApi.unfollow(membro.me.id);
                      if (result) {
                        Flushbar(
                          icon: Icon(Icons.check_box_outline_blank,
                              color: Colors.white),
                          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
                          flushbarPosition: FlushbarPosition.TOP,
                          message: "Deixou de seguir ${membro.me.displayName}",
                          duration: Duration(seconds: 3),
                        )..show(context);
                      }
                    } else {
                      var result = await UsersApi.follow(membro.me.id);
                      if (result) {
                        Flushbar(
                          icon: Icon(Icons.check_box, color: Colors.white),
                          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
                          flushbarPosition: FlushbarPosition.TOP,
                          message: "Seguindo ${membro.me.displayName}",
                          duration: Duration(seconds: 3),
                        )..show(context);
                      }
                    }
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
