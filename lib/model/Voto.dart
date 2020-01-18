library voto;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Voto.g.dart';

abstract class Voto implements Built<Voto, VotoBuilder> {
  Voto._();

  factory Voto([updates(VotoBuilder b)]) = _$Voto;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  int get user_id;

  @nullable
  @BuiltValueField(wireName: 'track_interno_id')
  int get trackInternoId;

  @nullable
  @BuiltValueField(wireName: 'cimavoto')
  bool get cimavoto;

  @nullable
  @BuiltValueField(wireName: 'refletir_spotify')
  bool get refletirSpotify;

  static Voto fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Voto voto = standardSerializers.deserializeWith(Voto.serializer, parsed);
    return voto;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Voto.serializer, this));
  }

  static Serializer<Voto> get serializer => _$votoSerializer;
}
