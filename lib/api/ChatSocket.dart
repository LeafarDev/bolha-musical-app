import 'dart:async';
import 'dart:convert';

import 'package:bolha_musical/model/MessageObj.dart';
import 'package:bolha_musical/model/RocketChatResponse.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/ramdom.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:web_socket_channel/io.dart';

import '../main.dart';

class ChatSocket {
  Timer _timer;
  Timer _timerAllMessages;
  IOWebSocketChannel _channel;
  BuildContext _context;
  int _currentIndex = 3;

  ChatSocket() {
    _timerAllMessages = Timer.periodic(Duration(seconds: 30), (_) {
      if (_channel != null  &&  store.state.bolhaAtual != null) {
        _channel.sink.add(_storyMessagesString());
      }
    });
    ConnectivityUtils.instance.isPhoneConnectedStream.listen((onData) async {
      if (_channel != null) {
        if (_channel.closeCode != 1000 && _channel.closeCode != null) {
          if (await ConnectivityUtils.instance.isPhoneConnected() == true &&  store.state.bolhaAtual != null) {
            // print("here we go again");
            startSocketChannel();
          }
        }
      }
    });
  }

  void setContext(context) {
    _context = context;
  }

  void setCurrentIndex (currentIndex) {
    _currentIndex = currentIndex;
  }
  void startSocketChannel() {
    try {
      _channel =
          new IOWebSocketChannel.connect("ws://10.0.0.108:3080/websocket");
      _channel.sink.add(_connectString());
      _channel.sink.add(_loginString());
      _channel.stream.listen((message) {
        if (message != false) {
          var messageObj = RocketChatResponse.fromJson(message);
          // handling of the incoming messages
          // print("incoming!!!>>");
          // print(message);
          if (messageObj.msg == "ping") {
            // print("pong");
            // print(_pongString());
            _channel.sink.add(_pongString());
          }

          if (messageObj.msg == "connected") {
            // print("connected::");
            _channel.sink.add(_storyMessagesString());
            _channel.sink.add(_subsScriptionMessageString());
          }

          if (messageObj.msg == "changed") {
            var response = json.decode(message);
            // print("remove constrainsts with strenght");
            MessageObj newMsg =
            MessageObj.fromJson(jsonEncode(response["fields"]["args"][0]));
            store.dispatch(SetMessage(newMsg));
            if(store.state.currentAppState == 'paused' || store.state.currentAppState == 'inactive') {
              _notificationMessage(newMsg);
            }
            if (_context != null && _currentIndex != 1) {
              Flushbar(
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
                flushbarPosition: FlushbarPosition.TOP,
                title:  newMsg.toDashMessage().user.name,
                message:  newMsg.msg,
                duration:  Duration(seconds: 3),
              )..show(_context);
            }

          }

          if (messageObj.msg == "result") {
            if (messageObj.result != null) {
              if (messageObj.result.messages != null) {
                List<MessageObj> messages = messageObj.result.messages.toList();
                messages.sort((a, b) {
                  return DateTime.fromMicrosecondsSinceEpoch(a.ts.date)
                      .compareTo(
                          DateTime.fromMicrosecondsSinceEpoch(b.ts.date));
                });
                messages = messages.where((f) => f.groupable != false).toList();
                store.dispatch(SetMessages(messages));
              }
            }
          }
        }
      }, onError: (error, StackTrace stackTrace) {
        // error handling
        // enquanto sem internet, ficar aguardando voltar pra rechamar conexão
        // print(error);
      }, onDone: () {
        // communication has been closed
        // print("i'm done");
      });
      // print("closed reason ${_channel.closeReason}");
    } catch (e) {
      // print("# closed reason ${_channel.closeReason}");

      ///
      /// An error occurred
      ///
      // print(e);
    }
  }

  _notificationMessage(MessageObj message) async {
    var messages = List<Message>();
    // First two person objects will use icons that part of the Android app's drawable resources
    var me = store.state.me.toNotificationMessagePerson();

    var person = message.toNotificationMessagePerson();

    messages.add(Message(
        message.msg, DateTime.now().add(Duration(minutes: 5)), person));

    var messagingStyle = MessagingStyleInformation(me,
        groupConversation: true,
        conversationTitle: store.state.bolhaAtual.apelido,
        htmlFormatContent: true,
        htmlFormatTitle: true,
        messages: messages);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'chat-notification-42',
        'chat-notification-420n',
        'chat-notification-42d',
        category: 'msg',
        style: AndroidNotificationStyle.Messaging,
        styleInformation: messagingStyle);
    var platformChannelSpecifics =
    NotificationDetails(androidPlatformChannelSpecifics, null);
    await flutterLocalNotificationsPlugin.show(
        42, 'message title', 'message body', platformChannelSpecifics, payload: "chat-notification");

  }


  sendMessage(ChatMessage message) {
    _channel.sink.add(jsonEncode({
      "msg": "method",
      "method": "sendMessage",
      "id": RandomString(17),
      "params": [
        {
          "_id": RandomString(17),
          "rid": store.state.bolhaAtual.rocket_chat_canal_id,
          "msg": message.text
        }
      ]
    }));
  }

  _connectString() {
    return jsonEncode({
      "msg": "connect",
      "version": "1",
      "support": ["1", "pre2", "pre1"]
    });
  }

  _loginString() {
    return jsonEncode({
      "msg": "method",
      "method": "login",
      "id": RandomString(17),
      "params": [
        {"resume": store.state.me.rocket_chat_auth_token}
      ]
    });
  }

  _pongString() {
    return jsonEncode({"msg": "pong"});
  }

  _storyMessagesString() {
    return jsonEncode({
      "msg": "method",
      "method": "loadHistory",
      "params": [
        store.state.bolhaAtual.rocket_chat_canal_id,
        null,
        500,
        {"\$date": 1578412284159}
      ],
      "id": "12"
    });
  }

  _subsScriptionMessageString() {
    return jsonEncode({
      "msg": "sub",
      "id": RandomString(17),
      "name": "stream-room-messages",
      "params": [
        store.state.bolhaAtual.rocket_chat_canal_id,
        {"useCollection": false, "args": []}
      ]
    });
  }

  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }

    if (_timerAllMessages != null) {
      _timerAllMessages.cancel();
    }
    _channel.sink.close();
  }
}
