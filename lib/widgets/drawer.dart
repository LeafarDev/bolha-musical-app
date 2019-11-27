import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/utils/UsersSessaoUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer>
    with SingleTickerProviderStateMixin {
  final String defaultImg =
      "https://scontent-gru1-1.xx.fbcdn.net/v/t1.0-1/c47.0.160.160a/p160x160/10354686_10150004552801856_220367501106153455_n.jpg?_nc_cat=1&_nc_ohc=yoc41iKTvLwAQkIPJ8r21Wl11o94LKJn-_adr_TnfzkVzYUkwD6AT5f5g&_nc_ht=scontent-gru1-1.xx&oh=42fa88bbe2d8542b4d10587935b4da09&oe=5E4EDE1E";
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
                            ? state.me.images[0].url
                            : defaultImg),
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
                  Navigator.pushReplacementNamed(context, '/mapa');
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
