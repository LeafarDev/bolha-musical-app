
library updated_at;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UpdatedAt.g.dart';

abstract class UpdatedAt implements Built<UpdatedAt, UpdatedAtBuilder> {
  UpdatedAt._();

  factory UpdatedAt([updates(UpdatedAtBuilder b)]) = _$UpdatedAt;

  @nullable
  @BuiltValueField(wireName: "\$date")
  int get date;

  static UpdatedAt fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    UpdatedAt result = standardSerializers.deserializeWith(
        UpdatedAt.serializer, parsed);
    return result;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(UpdatedAt.serializer, this));
  }

  String toString() {
    return (newBuiltValueToStringHelper('UpdatedAt')..add('\$date', date))
        .toString();
  }

  static Serializer<UpdatedAt> get serializer => _$updatedAtSerializer;
}
