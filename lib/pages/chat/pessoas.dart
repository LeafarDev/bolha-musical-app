import 'package:bolha_musical/pages/chat/widgets/pessoas_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Pessoas extends StatefulWidget {
  @override
  PessoasState createState() {
    return PessoasState();
  }
}

class PessoasState extends State<Pessoas> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black12,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, state) {
                    if (state.bolhaAtual == null) {
                      return Center(
                        child: Text(
                          "Nada aqui, tente entrar emm uma bolha",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: state.bolhaAtual.membros.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: PessoasItem(
                                  key: UniqueKey(),
                                  width: 50,
                                  height: 80,
                                  pessoa: state.bolhaAtual.membros[index]),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
