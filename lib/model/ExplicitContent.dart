library explicit_content;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ExplicitContent.g.dart';

abstract class ExplicitContent
    implements Built<ExplicitContent, ExplicitContentBuilder> {
  ExplicitContent._();

  factory ExplicitContent([updates(ExplicitContentBuilder b)]) =
      _$ExplicitContent;

  @BuiltValueField(wireName: 'filter_enabled')
  bool get filterEnabled;

  @BuiltValueField(wireName: 'filter_locked')
  bool get filterLocked;

  static Serializer<ExplicitContent> get serializer =>
      _$explicitContentSerializer;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(ExplicitContent.serializer, this));
  }
}
