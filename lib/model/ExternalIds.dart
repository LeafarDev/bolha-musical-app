library external_ids;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ExternalIds.g.dart';

abstract class ExternalIds implements Built<ExternalIds, ExternalIdsBuilder> {
  ExternalIds._();

  factory ExternalIds([updates(ExternalIdsBuilder b)]) = _$ExternalIds;

  @BuiltValueField(wireName: 'isrc')
  String get isrc;

  static ExternalIds fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    ExternalIds enternalIds =
        standardSerializers.deserializeWith(ExternalIds.serializer, parsed);
    return enternalIds;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(ExternalIds.serializer, this));
  }

  static Serializer<ExternalIds> get serializer => _$externalIdsSerializer;
}
