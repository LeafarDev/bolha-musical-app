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

  @nullable
  @BuiltValueField(wireName: 'raio_metros')
  double get raioMetros;

  @nullable
  @BuiltValueField(wireName: 'min')
  int get min;

  @nullable
  @BuiltValueField(wireName: 'max')
  int get max;

  static ReferenciaTamanhoBolha fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    ReferenciaTamanhoBolha message = standardSerializers.deserializeWith(
        ReferenciaTamanhoBolha.serializer, parsed);
    return message;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        ReferenciaTamanhoBolha.serializer, this));
  }

  static Serializer<ReferenciaTamanhoBolha> get serializer =>
      _$referenciaTamanhoBolhaSerializer;
}
