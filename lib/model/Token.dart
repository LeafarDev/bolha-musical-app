import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'Token.g.dart';

/*
   flutter packages pub run build_runner watch
   flutter packages pub run build_runner build
 */
abstract class Token implements Built<Token, TokenBuilder> {
  static Serializer<Token> get serializer => _$tokenSerializer;

  @nullable
  @BuiltValueField(wireName: 'token')
  String get token;

  Token._();

  static Token fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Token token = standardSerializers.deserializeWith(Token.serializer, parsed);
    return token;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Token.serializer, this));
  }

  factory Token([void Function(TokenBuilder) updates]) = _$Token;
}
