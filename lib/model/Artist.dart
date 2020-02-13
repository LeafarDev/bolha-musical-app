library artists;

import 'dart:convert';

import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'ExternalUrls.dart';

part 'Artist.g.dart';

abstract class Artist implements Built<Artist, ArtistBuilder> {
  Artist._();

  factory Artist([updates(ArtistBuilder b)]) = _$Artist;

  @BuiltValueField(wireName: 'external_urls')
  ExternalUrls get externalUrls;

  @BuiltValueField(wireName: 'href')
  String get href;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'uri')
  String get uri;

  static Artist fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Artist artist =
        standardSerializers.deserializeWith(Artist.serializer, parsed);
    return artist;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Artist.serializer, this));
  }

  static Serializer<Artist> get serializer => _$artistSerializer;
}
