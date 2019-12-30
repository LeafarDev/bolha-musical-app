import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:unicorndial/unicorndial.dart';

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
  List _childButtons = List<UnicornButton>();

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
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: UnicornDialer(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                parentButtonBackground: Colors.redAccent,
                orientation: UnicornOrientation.VERTICAL,
                parentButton: Icon(Icons.arrow_upward),
                childButtons: _childButtons),
          ),
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: StoreConnector<AppState, AppState>(
                      distinct: true,
                      converter: (store) => store.state,
                      builder: (context, state) {
                        return Center(child: Text("Make me beautiful, ok?"));
                      }),
                ),
                PlayerBar()
              ],
            ),
          )),
    );
  }
}
