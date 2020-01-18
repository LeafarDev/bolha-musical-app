library track;

import 'dart:convert';

import 'package:bolha_musical/model/Voto.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Album.dart';
import 'Artist.dart';
import 'ExternalIds.dart';
import 'ExternalUrls.dart';

part 'Track.g.dart';

abstract class Track implements Built<Track, TrackBuilder> {
  Track._();

  factory Track([updates(TrackBuilder b)]) = _$Track;

  @nullable
  @BuiltValueField(wireName: 'disc_number')
  int get discNumber;

  @nullable
  @BuiltValueField(wireName: 'id_interno')
  int get id_interno;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  int get popularity;

  @nullable
  @BuiltValueField(wireName: 'duration_ms')
  int get durationMs;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'explicit')
  bool get explicit;

  @nullable
  @BuiltValueField(wireName: 'saved')
  bool get saved;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: 'external_urls')
  ExternalUrls get externalUrls;

  @nullable
  @BuiltValueField(wireName: 'external_ids')
  ExternalIds get externalIds;

  @nullable
  @BuiltValueField(wireName: 'is_playable')
  bool get isPlayable;

  @nullable
  @BuiltValueField(wireName: 'preview_url')
  String get previewUrl;

  @nullable
  @BuiltValueField(wireName: 'track_number')
  int get trackNumber;

  @nullable
  @BuiltValueField(wireName: 'is_local')
  bool get isLocal;

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
  @BuiltValueField(wireName: 'votos')
  BuiltList<Voto> get votos;

  @nullable
  @BuiltValueField(wireName: 'album')
  Album get album;

  @nullable
  @BuiltValueField(wireName: 'href')
  String get href;

  @nullable
  @BuiltValueField(wireName: 'started_at')
  String get started_at;

  @nullable
  @BuiltValueField(wireName: 'current_playing')
  int get current_playing;


  String shortname({textSize = 20}) {
    if (name != null && name.length > textSize) {
      return "${name.substring(0, textSize)}...";
    }
    return name;
  }
  bool usuarioAtualCimaVotou () {
    List<Voto> result =
    votos.where((i) => i.user_id == store.state.me.user_id && i.cimavoto).toList();
    if (result.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool usuarioAtualBaixaVotou () {
    List<Voto> result =
    votos.where((i) => i.user_id == store.state.me.user_id && !i.cimavoto).toList();
    if (result.isNotEmpty) {
      return true;
    }
    return false;
  }
  static Track fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Track track = standardSerializers.deserializeWith(Track.serializer, parsed);
    return track;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Track.serializer, this));
  }

  static Serializer<Track> get serializer => _$trackSerializer;
}
