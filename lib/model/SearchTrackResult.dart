library search_track_result;

import 'dart:convert';

import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SearchTrackResult.g.dart';

abstract class SearchTrackResult
    implements Built<SearchTrackResult, SearchTrackResultBuilder> {
  SearchTrackResult._();

  factory SearchTrackResult([updates(SearchTrackResultBuilder b)]) =
      _$SearchTrackResult;

  @nullable
  @BuiltValueField(wireName: 'href')
  String get href;

  @nullable
  @BuiltValueField(wireName: 'limit')
  int get limit;

  @nullable
  @BuiltValueField(wireName: 'next')
  String get next;

  @nullable
  @BuiltValueField(wireName: 'offset')
  int get offset;

  @nullable
  @nullable
  @BuiltValueField(wireName: 'items')
  BuiltList<Track> get tracks;

  @nullable
  @BuiltValueField(wireName: 'previous')
  String get previous;

  @nullable
  @BuiltValueField(wireName: 'total')
  int get total;

  static SearchTrackResult fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    SearchTrackResult searchTrackResult = standardSerializers.deserializeWith(
        SearchTrackResult.serializer, parsed);
    return searchTrackResult;
  }

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(SearchTrackResult.serializer, this));
  }

  static Serializer<SearchTrackResult> get serializer =>
      _$searchTrackResultSerializer;
}
