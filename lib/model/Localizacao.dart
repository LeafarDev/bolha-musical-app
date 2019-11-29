library localizacao;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Localizacao.g.dart';

abstract class Localizacao implements Built<Localizacao, LocalizacaoBuilder> {
  Localizacao._();

  factory Localizacao([updates(LocalizacaoBuilder b)]) = _$Localizacao;

  @nullable
  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @nullable
  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  static Localizacao fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Localizacao localizacao =
        standardSerializers.deserializeWith(Localizacao.serializer, parsed);
    return localizacao;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(Localizacao.serializer, this));
  }

  static Serializer<Localizacao> get serializer => _$localizacaoSerializer;
}
