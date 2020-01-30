import 'package:bolha_musical/pages/app.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return ChatScreenState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ChatScreenState extends State<ChatScreen> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  @override
  initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
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
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Expanded(
                child: StoreConnector<AppState, List<ChatMessage>>(
                    distinct: true,
                    converter: (store) => store.state.chatMessages,
                    rebuildOnChange: true,
                    builder: (context, state) {
                      if (store.state.bolhaAtual == null) {
                        return Center(
                          child: Text(
                            "Nenhum mensagem. Entre em uma bolha para adicionar músicas",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return DashChat(
                        key: _chatViewKey,
                        shouldShowLoadEarlier: true,
                        height: MediaQuery.of(context).size.height - 118,
                        messages: state,
                        user: store.state.me.toDashUSer(),
                        scrollToBottom: true,
                        onSend: (m) => App.chatSocket.sendMessage(m),
                        sendButtonBuilder: (Function onSend) {
                          return ConnectivityWidget(
                              showOfflineBanner: false,
                              builder: (context, isOnline) {
                                if (isOnline) {
                                  return IconButton(
                                      icon: Icon(
                                        Icons.send,
                                      ),
                                      onPressed: onSend);
                                } else {
                                  return IconButton(
                                      icon: Icon(Icons.warning,
                                          color: Colors.orange),
                                      onPressed: () {
                                        Flushbar(
                                          icon: Icon(
                                            Icons
                                                .signal_cellular_connected_no_internet_4_bar,
                                            color: Colors.white,
                                          ),
                                          flushbarPosition:
                                              FlushbarPosition.BOTTOM,
                                          backgroundColor: Colors.orange,
                                          message:
                                              "Impossível enviar mensagem, aguardando conexão",
                                          duration: Duration(seconds: 3),
                                        )..show(context);
                                      });
                                }
                              });
                        },
                        showUserAvatar: true,
                        inverted: false,
                      );
                    }),
              ),
              PlayerBar()
            ],
          ))),
    );
  }
}
