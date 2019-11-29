library bolha_membro;

import 'dart:convert';

import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'BolhaMembro.g.dart';

abstract class BolhaMembro implements Built<BolhaMembro, BolhaMembroBuilder> {
  BolhaMembro._();

  factory BolhaMembro([updates(BolhaMembroBuilder b)]) = _$BolhaMembro;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'bolha_id')
  int get bolhaId;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  int get userId;

  @nullable
  @BuiltValueField(wireName: 'checkin')
  String get checkin;

  @nullable
  @BuiltValueField(wireName: 'checkout')
  String get checkout;

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
  @nullable
  @BuiltValueField(wireName: 'me')
  Me get me;

  static BolhaMembro fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    BolhaMembro localizacao =
        standardSerializers.deserializeWith(BolhaMembro.serializer, parsed);
    return localizacao;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(BolhaMembro.serializer, this));
  }

  static Serializer<BolhaMembro> get serializer => _$bolhaMembroSerializer;
}
