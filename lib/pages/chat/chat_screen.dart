import 'dart:io';

import 'package:bolha_musical/pages/chat/ChatSocket.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';

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
  ChatSocket _chatSocket;
  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  initState() {
    super.initState();
    _chatSocket = ChatSocket();
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
    _chatSocket.dispose();
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
                        return Center(child: Text("Isso aqui está muito vazio !", style: TextStyle(color: Colors.white) ,),);
                      }
                      return DashChat(
                        key: _chatViewKey,
                        height: MediaQuery.of(context).size.height - 118,
                        messages: state,
                        user: store.state.me.toDashUSer(),
                        scrollToBottom: false,
                        onSend: (m) => _chatSocket.sendMessage(m),
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
