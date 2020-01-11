library root_dto;

import 'dart:convert';

import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart' as prefix0;

import 'Ts.dart';
import 'U.dart';
import 'UpdatedAt.dart';

part 'Message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  Message._();

  factory Message([updates(MessageBuilder b)]) = _$Message;

  @nullable
  @BuiltValueField(wireName: '_id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'rid')
  String get rid;

  @nullable
  @BuiltValueField(wireName: 'msg')
  String get msg;

  @nullable
  @BuiltValueField(wireName: 'ts')
  Ts get ts;

  @nullable
  @BuiltValueField(wireName: 'u')
  U get u;

  @nullable
  @BuiltValueField(wireName: 'groupable')
  bool get groupable;

  @nullable
  @BuiltValueField(wireName: '_updatedAt')
  UpdatedAt get updatedAt;

  getUser() {
    Bolha bolhaAtual = store.state.bolhaAtual;
    if (bolhaAtual != null) {
      List<BolhaMembro> result =
          bolhaAtual.membros.where((i) => i.me.id == u.username).toList();
      if (result.isNotEmpty) {
        return result[0].me;
      }
    }
    return null;
  }

  getImage() {
    var user = getUser();
    if (getUser() != null) {
      return user.getImage();
    }
    return store.state.padraoPerfilFoto;
  }

  static Message fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Message message =
        standardSerializers.deserializeWith(Message.serializer, parsed);
    return message;
  }

  dashUserGuest() {
    return ChatUser(
        name: "Visitante",
        avatar: getImage(),
        containerColor: prefix0.Colors.pink,
        color: prefix0.Colors.white);
  }

  toDashMessage() {
    var user = getUser();
    ChatUser dashUser = null;
    if (user != null) {
      dashUser = user.toDashUSer();
    } else {
      dashUser = dashUserGuest();
    }

    return ChatMessage(
        id: id,
        text: msg,
        createdAt: DateTime.fromMillisecondsSinceEpoch(ts.date),
        user: dashUser);
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Message.serializer, this));
  }

  static Serializer<Message> get serializer => _$messageSerializer;
}
