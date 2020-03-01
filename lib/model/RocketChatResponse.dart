library rocket_chat_response;

import 'dart:convert';

import 'package:bolha_musical/model/RocketChatResultResponse.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'RocketChatResponse.g.dart';

abstract class RocketChatResponse
    implements Built<RocketChatResponse, RocketChatResponseBuilder> {
  RocketChatResponse._();

  factory RocketChatResponse([updates(RocketChatResponseBuilder b)]) =
      _$RocketChatResponse;

  @nullable
  @BuiltValueField(wireName: 'msg')
  String get msg;

  @nullable
  @BuiltValueField(wireName: 'result')
  RocketChatResultResponse get result;

  static RocketChatResponse fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    RocketChatResponse result = standardSerializers.deserializeWith(
        RocketChatResponse.serializer, parsed);
    return result;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(RocketChatResponse.serializer, this));
  }

  static Serializer<RocketChatResponse> get serializer =>
      _$rocketChatResponseSerializer;
}
