import 'package:bolha_musical/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Esqueleto extends StatefulWidget {
  @override
  _EsqueletoState createState() => new _EsqueletoState();
}

class _EsqueletoState extends State<Esqueleto> {
  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Center(child: Text("THIS IS REAL LIFE ?"));
        },
      ),
    );
  }
}
