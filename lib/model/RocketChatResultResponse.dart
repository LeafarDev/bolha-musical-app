library rocket_chat_result_response;

import 'dart:convert';

import 'package:bolha_musical/model/Message.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'RocketChatResultResponse.g.dart';

abstract class RocketChatResultResponse
    implements Built<RocketChatResultResponse, RocketChatResultResponseBuilder> {
  RocketChatResultResponse._();

  factory RocketChatResultResponse([updates(RocketChatResultResponseBuilder b)]) =
  _$RocketChatResultResponse;

  @nullable
  @BuiltValueField(wireName: 'messages')
  BuiltList<Message> get messages;

  static RocketChatResultResponse fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    RocketChatResultResponse result = standardSerializers.deserializeWith(
        RocketChatResultResponse.serializer, parsed);
    return result;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(RocketChatResultResponse.serializer, this));
  }

  static Serializer<RocketChatResultResponse> get serializer =>
      _$rocketChatResultResponseSerializer;
}
