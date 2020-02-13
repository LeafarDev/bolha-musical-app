library album;

import 'dart:convert';

import 'package:bolha_musical/model/SpotifyImage.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Artist.dart';
import 'ExternalUrls.dart';

part 'Album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  Album._();

  factory Album([updates(AlbumBuilder b)]) = _$Album;

  @nullable
  @BuiltValueField(wireName: 'album_type')
  String get albumType;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'images')
  BuiltList<SpotifyImage> get images;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'release_date_precision')
  String get releaseDatePrecision;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: 'external_urls')
  ExternalUrls get externalUrls;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'uri')
  String get uri;

  @nullable
  @BuiltValueField(wireName: 'artists')
  BuiltList<Artist> get artists;

  @nullable
  @BuiltValueField(wireName: 'total_tracks')
  int get totalTracks;

  @nullable
  @BuiltValueField(wireName: 'href')
  String get href;

  String shortname() {
    if (name != null && name.length > 25) {
      return "${name.substring(0, 25)}...";
    }
    return name;
  }

  static Album fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Album album = standardSerializers.deserializeWith(Album.serializer, parsed);
    return album;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Album.serializer, this));
  }

  static Serializer<Album> get serializer => _$albumSerializer;
}
