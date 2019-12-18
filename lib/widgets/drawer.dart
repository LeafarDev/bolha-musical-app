import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/UsersSessaoUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: InkWell(
                    onTap: () {
                      print("currentAccountPicture: InkWell");
                    },
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "hero tag",
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(state.me.images != null
                            ? state.me.images.length > 0
                                ? state.me.images[0].url
                                : state.padraoPerfilFoto
                            : state.padraoPerfilFoto),
                      ),
                    ),
                  ),
                  accountName: Text(state.me.displayName != null
                      ? state.me.displayName
                      : "Carregando..."),
                  accountEmail:
                      Text(state.me.email != null ? state.me.email : "..."),
                  otherAccountsPictures: <Widget>[
                    RotationTransition(
                      turns: _refreshController,
                      child: IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          UsersSessaoUtils.getMeFromTokenAndStore();
                        },
                      ),
                    ),
                  ],
                ),
                getListTile(
                    'Mapa',
                    Icon(
                      Icons.map,
                    ), onTap: () {
                  if (ModalRoute.of(context).settings.name != '/mapa' &&
                      ModalRoute.of(context).settings.name != '/playlist' &&
                      ModalRoute.of(context).settings.name != '/bolhas' &&
                      ModalRoute.of(context).settings.name != '/chat' &&
                      ModalRoute.of(context).settings.name != '/track-search') {
                    store.dispatch(SetCurrentBottomBarIndex(0));
                    Navigator.pushReplacementNamed(context, '/mapa');
                  }
                })
              ],
            ),
          );
        });
  }

  Widget getListTile(title, icon, {Function onTap}) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }
}
