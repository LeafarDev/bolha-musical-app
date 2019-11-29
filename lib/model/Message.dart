library message;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Me.dart';

part 'Message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  Message._();

  factory Message([updates(MessageBuilder b)]) = _$Message;

  @nullable
  @BuiltValueField(wireName: 'sender')
  Me get sender;

  @nullable
  @BuiltValueField(wireName: 'time')
  String get time;

  @nullable
  @BuiltValueField(wireName: 'text')
  String get text;

  @nullable
  @BuiltValueField(wireName: 'isLiked')
  bool get isLiked;

  @nullable
  @BuiltValueField(wireName: 'unread')
  bool get unread;

  static Message fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Message token =
        standardSerializers.deserializeWith(Message.serializer, parsed);
    return token;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Message.serializer, this));
  }

  static Serializer<Message> get serializer => _$messageSerializer;
}
