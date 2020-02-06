import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/dialogPerfil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PessoasItem extends StatelessWidget {
  final double width;
  final double height;
  final BolhaMembro pessoa;

  const PessoasItem({Key key, this.width, this.height, this.pessoa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
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
            showCustomDialogWithImage(context, pessoa);
          },
          leading: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(pessoa.me.getImage())),
          subtitle: Text(
            store.state.bolhaAtual.userLiderId == pessoa.id
                ? "Lider"
                : "Membro",
            style: TextStyle(color: Colors.white),
          ),
          title: Text(
            pessoa.me.displayName,
            style: TextStyle(color: Colors.white),
          ),
          trailing: _iconButtonBuild(context),
        ),
      ),
    );
  }

  _iconButtonBuild(context) {
    // TODO: remover add button quando já estiver adicionado
    return Material(
        color: Colors.transparent,
        child: RawMaterialButton(
          onPressed: () async {},
          elevation: 0,
          shape: CircleBorder(),
          splashColor: Colors.grey,
          fillColor: Colors.transparent,
        ));
  }
}
