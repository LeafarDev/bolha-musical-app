library referencia_tamanho_bolha;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ReferenciaTamanhoBolha.g.dart';

abstract class ReferenciaTamanhoBolha
    implements Built<ReferenciaTamanhoBolha, ReferenciaTamanhoBolhaBuilder> {
  ReferenciaTamanhoBolha._();

  factory ReferenciaTamanhoBolha([updates(ReferenciaTamanhoBolhaBuilder b)]) =
      _$ReferenciaTamanhoBolha;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'raio_metros')
  int get raioMetros;

  @BuiltValueField(wireName: 'min')
  int get min;

  @BuiltValueField(wireName: 'max')
  int get max;

  @BuiltValueField(wireName: 'deleted_at')
  String get deletedAt;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  static ReferenciaTamanhoBolha fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    ReferenciaTamanhoBolha referenciaTamanhoBolha = standardSerializers
        .deserializeWith(ReferenciaTamanhoBolha.serializer, parsed);
    return referenciaTamanhoBolha;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        ReferenciaTamanhoBolha.serializer, this));
  }

  static Serializer<ReferenciaTamanhoBolha> get serializer =>
      _$referenciaTamanhoBolhaSerializer;
}
