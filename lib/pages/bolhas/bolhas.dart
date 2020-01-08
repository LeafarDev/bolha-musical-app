import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/pages/bolhas/widgets/bolha_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:unicorndial/unicorndial.dart';

import 'bolha_form.dart';

class Bolhas extends StatefulWidget {
  @override
  BolhasState createState() {
    return BolhasState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class BolhasState extends State<Bolhas> {
  Timer _timer;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  initState() {
    super.initState();
    BolhaApi.getBolhasDisponiveis();
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        BolhaApi.getBolhasDisponiveis();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Novo",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => BolhasForm());
          },
        )));
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
                childButtons: childButtons),
          ),
        backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () {
                return BolhaApi.getBolhasDisponiveis();
              },
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: StoreConnector<AppState, AppState>(
                          converter: (store) => store.state,
                          builder: (context, state) {
                            return AnimationLimiter(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: state.bolhasDisponiveis.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      verticalOffset: 44.0,
                                      child: FadeInAnimation(
                                        child: BolhaItem(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 70.0,
                                          bolha: state.bolhasDisponiveis[index],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                    PlayerBar()
                  ],
                ),
              )),
          ),
    );
  }
}
