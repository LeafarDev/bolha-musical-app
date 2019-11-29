library bolha;

import 'dart:convert';

import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'User.dart';

part 'Bolha.g.dart';

abstract class Bolha implements Built<Bolha, BolhaBuilder> {
  Bolha._();

  factory Bolha([updates(BolhaBuilder b)]) = _$Bolha;

  @BuiltValueField(wireName: 'id')
  int get id;


  @BuiltValueField(wireName: 'apelido')
  String get apelido;

  @nullable
  @BuiltValueField(wireName: 'cor')
  String get cor;

  @nullable
  @BuiltValueField(wireName: 'eh_fixa')
  bool get ehFixa;

  @nullable
  @BuiltValueField(wireName: 'user_id_referencia_raio')
  int get userIdReferenciaRaio;

  @nullable
  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @nullable
  @BuiltValueField(wireName: 'raio')
  double get raio;

  @nullable
  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  @nullable
  @BuiltValueField(wireName: 'user_lider_id')
  int get userLiderId;

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
  @BuiltValueField(wireName: 'bolha_id')
  int get bolhaId;

  @nullable
  @BuiltValueField(wireName: 'membros')
  BuiltList<BolhaMembro> get membros;

  @nullable
  @BuiltValueField(wireName: 'lider')
  User get lider;

  static Bolha fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Bolha localizacao =
        standardSerializers.deserializeWith(Bolha.serializer, parsed);
    return localizacao;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Bolha.serializer, this));
  }

  static Serializer<Bolha> get serializer => _$bolhaSerializer;
}
