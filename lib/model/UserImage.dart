library image_user;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UserImage.g.dart';

abstract class UserImage implements Built<UserImage, UserImageBuilder> {
  UserImage._();

  static Serializer<UserImage> get serializer => _$userImageSerializer;

  factory UserImage([updates(UserImageBuilder b)]) = _$UserImage;

  @nullable
  @BuiltValueField(wireName: 'height')
  String get height;

  @nullable
  @BuiltValueField(wireName: 'url')
  String get url;

  @nullable
  @BuiltValueField(wireName: 'width')
  String get width;

  static UserImage fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    UserImage token =
        standardSerializers.deserializeWith(UserImage.serializer, parsed);
    return token;
  }

  String toJson() {
    return json.encode(serializers.serializeWith(UserImage.serializer, this));
  }
}
