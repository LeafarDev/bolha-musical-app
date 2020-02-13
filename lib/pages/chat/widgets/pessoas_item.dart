import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
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
          onTap: () async {
            var seguindo = await UsersApi.following(pessoa.me.id);
            print("gambe ${seguindo}");
            showCustomDialogWithImage(locator<NavigationService>()
                .navigatorKey
                .currentState
                .overlay
                .context, pessoa, seguindo);
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
            "what the ?",
            style: TextStyle(color: Colors.white),
          ),
          trailing: _iconButtonBuild(context, pessoa),
        ),
      ),
    );
  }

  _iconButtonBuild(context, BolhaMembro pessoa) {
    if (store.state.me.id != pessoa.me.id) {
      return PopupMenuButton<int>(
        icon: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onSelected: (selectedDropDownItem) {
          if (selectedDropDownItem == 1) {
            BolhaApi.expulsarBolha(pessoa.userId);
          }
        },
        itemBuilder: (context) => _popupList(pessoa),
      );
    }
  }

  _popupList(BolhaMembro pessoa) {
    List<PopupMenuEntry<int>> lista = [];
    if (store.state.me.user_id == store.state.bolhaAtual.userLiderId &&
        store.state.me.id != pessoa.me.id) {
      lista.add(
        PopupMenuItem(
          value: 1,
          child: Text("Expulsar da bolha"),
        ),
      );
    }
    return lista;
  }
}
