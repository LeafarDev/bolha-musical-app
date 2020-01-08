import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Eu extends StatefulWidget {
  @override
  EuState createState() {
    return EuState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class EuState extends State<Eu> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Center(
              child: Text(
                store.state.me.displayName != null
                    ? store.state.me.displayName
                    : "Carregando...",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            elevation: 0.0,
          ),
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: SafeArea(
            child: StoreConnector<AppState, AppState>(
                distinct: true,
                converter: (store) => store.state,
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                  state.me.images != null
                                      ? state.me.images[0].url
                                      : state.padraoPerfilFoto,
                                ),
                                radius: 100,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.white),
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Icon(
                                              Icons.people,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "${state.me.followers.total} Seguidores"),
                                      ],
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextSpan(text: "${state.me.country}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.pink,
                        child: Center(
                          child: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Sair",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      PlayerBar()
                    ],
                  );
                }),
          )),
    );
  }
}
