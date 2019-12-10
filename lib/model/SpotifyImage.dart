library image_user;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SpotifyImage.g.dart';

abstract class SpotifyImage
    implements Built<SpotifyImage, SpotifyImageBuilder> {
  SpotifyImage._();

  static Serializer<SpotifyImage> get serializer => _$spotifyImageSerializer;

  factory SpotifyImage([updates(SpotifyImageBuilder b)]) = _$SpotifyImage;

  @nullable
  @BuiltValueField(wireName: 'height')
  int get height;

  @nullable
  @BuiltValueField(wireName: 'url')
  String get url;

  @nullable
  @BuiltValueField(wireName: 'width')
  int get width;

  static SpotifyImage fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    SpotifyImage token =
        standardSerializers.deserializeWith(SpotifyImage.serializer, parsed);
    return token;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(SpotifyImage.serializer, this));
  }
}
