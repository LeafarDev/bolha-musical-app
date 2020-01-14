import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/pages/bolhas/widgets/bolha_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  GlobalKey _fabKey = GlobalObjectKey("fab");

  @override
  initState() {
    super.initState();
    BolhaApi.getBolhasDisponiveis();
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      BolhaApi.getBolhasDisponiveis();
    });
    _handleShowFab();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  _handleShowFab () async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('ja-viu-tutorial-add-bolha');
    var jaViu = prefs.getString('ja-viu-tutorial-add-bolha') ?? null;
    if (jaViu == null) {
      prefs.setString('ja-viu-tutorial-add-bolha', "1");
      Timer(Duration(seconds: 1), () => showCoachMarkFAB());
    }
  }

  void showCoachMarkFAB() {
    CoachMark coachMarkFAB = CoachMark();
    RenderBox target = _fabKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(
        center: Offset(markRect.left + 30.0, markRect.bottom - 55.0),
        radius: markRect.longestSide * 0.05);

    coachMarkFAB.show(
        targetContext: _fabKey.currentContext,
        markRect: markRect,
        children: [
          Positioned(
              top: markRect.top - 55.0,
              right: 10.0,
              child: Text("Aperte para criar uma bolha",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: null,);
  }

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Criar Bolha",
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
          key: _fabKey,
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
