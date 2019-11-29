library user;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'User.g.dart';

abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'email')
  String get email;

  @nullable
  @BuiltValueField(wireName: 'is_active')
  int get isActive;

  @nullable
  @BuiltValueField(wireName: 'spotify_client_id')
  String get spotifyClientId;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  String get createdBy;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  @nullable
  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @nullable
  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  @nullable
  @BuiltValueField(wireName: 'data_ultima_localizacao')
  String get dataUltimaLocalizacao;

  static User fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    User localizacao =
        standardSerializers.deserializeWith(User.serializer, parsed);
    return localizacao;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(User.serializer, this));
  }

  static Serializer<User> get serializer => _$userSerializer;
}
