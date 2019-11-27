import 'dart:convert' as json;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'AuthState.g.dart';

/*
   flutter packages pub run build_runner watch
   flutter packages pub run build_runner build
 */
abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  static Serializer<AuthState> get serializer => _$authStateSerializer;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'expires_at')
  String get expiresAt;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  AuthState._();

  static AuthState fromJson(String jsonString) {
    final parsed = json.jsonDecode(jsonString);
    AuthState me = standardSerializers.deserializeWith(AuthState.serializer, parsed);
    return me;
  }

  String toJson() {
    final parsed = json.jsonEncode(this);
    return standardSerializers.serializeWith(AuthState.serializer, parsed);
  }

  factory AuthState([void Function(AuthStateBuilder) updates]) = _$AuthState;
}