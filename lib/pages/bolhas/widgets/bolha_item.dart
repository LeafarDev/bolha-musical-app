import 'package:bolha_musical/model/Bolha.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BolhaItem extends StatelessWidget {
  final double width;
  final double height;
  final Bolha bolha;

  const BolhaItem({Key key, this.width, this.height, this.bolha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => FancyDialog(
                ok: "Entrar",
                cancel: "Canelar...",
                gifPath: FancyGif.MOVE_FORWARD,
                title: "Entrar na bolha?",
                descreption: "Ao entrar nessa bolha você sairá de qualquer bolha caso, esteja em uma.",
                okFun: () {
                  print("okk");
                },
                cancelFun: () {
                  print("cancelFun");
                },
              )
          );
        },
        leading: Icon(
          Icons.bubble_chart,
          color: Colors.greenAccent,
        ),
        title: Text(bolha.apelido, style: Theme.of(context).textTheme.body1),
        trailing: Column(
          children: <Widget>[
            Text("1/∞"),
            Icon(
              Icons.people,
              color: Colors.black,
            )
          ],
        ),
      ),
    );

  }
}
