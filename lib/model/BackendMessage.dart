library backend_message;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'BackendMessage.g.dart';

abstract class BackendMessage
    implements Built<BackendMessage, BackendMessageBuilder> {
  BackendMessage._();

  factory BackendMessage([updates(BackendMessageBuilder b)]) = _$BackendMessage;

  @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  static BackendMessage fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    BackendMessage backendMessage =
        standardSerializers.deserializeWith(BackendMessage.serializer, parsed);
    return backendMessage;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(BackendMessage.serializer, this));
  }

  static Serializer<BackendMessage> get serializer =>
      _$backendMessageSerializer;
}
