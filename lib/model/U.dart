library u;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'U.g.dart';

abstract class U implements Built<U, UBuilder> {
  U._();

  factory U([updates(UBuilder b)]) = _$U;

  @nullable
  @BuiltValueField(wireName: '_id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'username')
  String get username;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  static U fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    U result = standardSerializers.deserializeWith(U.serializer, parsed);
    return result;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(U.serializer, this));
  }

  static Serializer<U> get serializer => _$uSerializer;
}
