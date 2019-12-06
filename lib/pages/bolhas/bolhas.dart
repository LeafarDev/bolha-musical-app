import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/pages/bolhas/widgets/bolha_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/bottomBar.dart';
import 'package:bolha_musical/widgets/drawer.dart';
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
  int cont = 0;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        cont = cont + 1;
        print(cont);
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
          drawer: HomeDrawer(),
          floatingActionButton: UnicornDialer(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              parentButtonBackground: Colors.redAccent,
              orientation: UnicornOrientation.VERTICAL,
              parentButton: Icon(Icons.arrow_upward),
              childButtons: childButtons),
          appBar: AppBar(
              title: Text('Bolhas'),
              backgroundColor: Color.fromRGBO(1, 41, 51, 1),
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    BolhaApi.getBolhasDisponiveis();
                  },
                ),
              ]),
          body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () {
                return BolhaApi.getBolhasDisponiveis();
              },
              child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, state) {
                    return SafeArea(
                      child: AnimationLimiter(
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 70.0,
                                    bolha: state.bolhasDisponiveis[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  })),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(1, 41, 51, 1),
            currentIndex: store.state.currentBottomBarIndex,
            items: bottomBarList(),
            onTap: (index) {
              handleBottomTap(index);
            },
          )),
    );
  }
}
