library ts;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Ts.g.dart';

abstract class Ts implements Built<Ts, TsBuilder> {
  Ts._();

  factory Ts([updates(TsBuilder b)]) = _$Ts;

  @nullable
  @BuiltValueField(wireName: "\$date")
  int get $date;

  static Ts fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Ts result = standardSerializers.deserializeWith(
        Ts.serializer, parsed);
    return result;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(Ts.serializer, this));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Ts')..add('\$date', $date)).toString();
  }

  static Serializer<Ts> get serializer => _$tsSerializer;
}