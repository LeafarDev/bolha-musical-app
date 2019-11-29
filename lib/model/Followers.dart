library followers;
import 'dart:convert';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Followers.g.dart';

abstract class Followers implements Built<Followers, FollowersBuilder> {
  Followers._();

  factory Followers([updates(FollowersBuilder b)]) = _$Followers;

  @nullable
  @BuiltValueField(wireName: 'href')
  String get href;

  @nullable
  @BuiltValueField(wireName: 'total')
  int get total;

  static Serializer<Followers> get serializer => _$followersSerializer;

  String toJson() {
    return json.encode(standardSerializers.serializeWith(Followers.serializer, this));
  }

}
