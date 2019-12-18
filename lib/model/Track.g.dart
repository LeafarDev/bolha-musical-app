// GENERATED CODE - DO NOT MODIFY BY HAND

part of track;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Track> _$trackSerializer = new _$TrackSerializer();

class _$TrackSerializer implements StructuredSerializer<Track> {
  @override
  final Iterable<Type> types = const [Track, _$Track];
  @override
  final String wireName = 'Track';

  @override
  Iterable<Object> serialize(Serializers serializers, Track object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.discNumber != null) {
      result
        ..add('disc_number')
        ..add(serializers.serialize(object.discNumber,
            specifiedType: const FullType(int)));
    }
    if (object.popularity != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(object.popularity,
            specifiedType: const FullType(int)));
    }
    if (object.durationMs != null) {
      result
        ..add('duration_ms')
        ..add(serializers.serialize(object.durationMs,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.explicit != null) {
      result
        ..add('explicit')
        ..add(serializers.serialize(object.explicit,
            specifiedType: const FullType(bool)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.externalUrls != null) {
      result
        ..add('external_urls')
        ..add(serializers.serialize(object.externalUrls,
            specifiedType: const FullType(ExternalUrls)));
    }
    if (object.externalIds != null) {
      result
        ..add('external_ids')
        ..add(serializers.serialize(object.externalIds,
            specifiedType: const FullType(ExternalIds)));
    }
    if (object.isPlayable != null) {
      result
        ..add('is_playable')
        ..add(serializers.serialize(object.isPlayable,
            specifiedType: const FullType(bool)));
    }
    if (object.previewUrl != null) {
      result
        ..add('preview_url')
        ..add(serializers.serialize(object.previewUrl,
            specifiedType: const FullType(String)));
    }
    if (object.trackNumber != null) {
      result
        ..add('track_number')
        ..add(serializers.serialize(object.trackNumber,
            specifiedType: const FullType(int)));
    }
    if (object.isLocal != null) {
      result
        ..add('is_local')
        ..add(serializers.serialize(object.isLocal,
            specifiedType: const FullType(bool)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.uri != null) {
      result
        ..add('uri')
        ..add(serializers.serialize(object.uri,
            specifiedType: const FullType(String)));
    }
    if (object.artists != null) {
      result
        ..add('artists')
        ..add(serializers.serialize(object.artists,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Artist)])));
    }
    if (object.album != null) {
      result
        ..add('album')
        ..add(serializers.serialize(object.album,
            specifiedType: const FullType(Album)));
    }
    if (object.href != null) {
      result
        ..add('href')
        ..add(serializers.serialize(object.href,
            specifiedType: const FullType(String)));
    }
    if (object.started_at != null) {
      result
        ..add('started_at')
        ..add(serializers.serialize(object.started_at,
            specifiedType: const FullType(String)));
    }
    if (object.current_playing != null) {
      result
        ..add('current_playing')
        ..add(serializers.serialize(object.current_playing,
            specifiedType: const FullType(int)));
    }
    if (object.cimavotos != null) {
      result
        ..add('cimavotos')
        ..add(serializers.serialize(object.cimavotos,
            specifiedType: const FullType(int)));
    }
    if (object.baixavotos != null) {
      result
        ..add('baixavotos')
        ..add(serializers.serialize(object.baixavotos,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Track deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'disc_number':
          result.discNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'duration_ms':
          result.durationMs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'explicit':
          result.explicit = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'external_urls':
          result.externalUrls.replace(serializers.deserialize(value,
              specifiedType: const FullType(ExternalUrls)) as ExternalUrls);
          break;
        case 'external_ids':
          result.externalIds.replace(serializers.deserialize(value,
              specifiedType: const FullType(ExternalIds)) as ExternalIds);
          break;
        case 'is_playable':
          result.isPlayable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'preview_url':
          result.previewUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'track_number':
          result.trackNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_local':
          result.isLocal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'artists':
          result.artists.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Artist)]))
              as BuiltList<dynamic>);
          break;
        case 'album':
          result.album.replace(serializers.deserialize(value,
              specifiedType: const FullType(Album)) as Album);
          break;
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'started_at':
          result.started_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_playing':
          result.current_playing = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cimavotos':
          result.cimavotos = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'baixavotos':
          result.baixavotos = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Track extends Track {
  @override
  final int discNumber;
  @override
  final int popularity;
  @override
  final int durationMs;
  @override
  final String name;
  @override
  final bool explicit;
  @override
  final String type;
  @override
  final ExternalUrls externalUrls;
  @override
  final ExternalIds externalIds;
  @override
  final bool isPlayable;
  @override
  final String previewUrl;
  @override
  final int trackNumber;
  @override
  final bool isLocal;
  @override
  final String id;
  @override
  final String uri;
  @override
  final BuiltList<Artist> artists;
  @override
  final Album album;
  @override
  final String href;
  @override
  final String started_at;
  @override
  final int current_playing;
  @override
  final int cimavotos;
  @override
  final int baixavotos;

  factory _$Track([void Function(TrackBuilder) updates]) =>
      (new TrackBuilder()..update(updates)).build();

  _$Track._(
      {this.discNumber,
      this.popularity,
      this.durationMs,
      this.name,
      this.explicit,
      this.type,
      this.externalUrls,
      this.externalIds,
      this.isPlayable,
      this.previewUrl,
      this.trackNumber,
      this.isLocal,
      this.id,
      this.uri,
      this.artists,
      this.album,
      this.href,
      this.started_at,
      this.current_playing,
      this.cimavotos,
      this.baixavotos})
      : super._();

  @override
  Track rebuild(void Function(TrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackBuilder toBuilder() => new TrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Track &&
        discNumber == other.discNumber &&
        popularity == other.popularity &&
        durationMs == other.durationMs &&
        name == other.name &&
        explicit == other.explicit &&
        type == other.type &&
        externalUrls == other.externalUrls &&
        externalIds == other.externalIds &&
        isPlayable == other.isPlayable &&
        previewUrl == other.previewUrl &&
        trackNumber == other.trackNumber &&
        isLocal == other.isLocal &&
        id == other.id &&
        uri == other.uri &&
        artists == other.artists &&
        album == other.album &&
        href == other.href &&
        started_at == other.started_at &&
        current_playing == other.current_playing &&
        cimavotos == other.cimavotos &&
        baixavotos == other.baixavotos;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc(0, discNumber.hashCode), popularity.hashCode),
                                                                                durationMs.hashCode),
                                                                            name.hashCode),
                                                                        explicit.hashCode),
                                                                    type.hashCode),
                                                                externalUrls.hashCode),
                                                            externalIds.hashCode),
                                                        isPlayable.hashCode),
                                                    previewUrl.hashCode),
                                                trackNumber.hashCode),
                                            isLocal.hashCode),
                                        id.hashCode),
                                    uri.hashCode),
                                artists.hashCode),
                            album.hashCode),
                        href.hashCode),
                    started_at.hashCode),
                current_playing.hashCode),
            cimavotos.hashCode),
        baixavotos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Track')
          ..add('discNumber', discNumber)
          ..add('popularity', popularity)
          ..add('durationMs', durationMs)
          ..add('name', name)
          ..add('explicit', explicit)
          ..add('type', type)
          ..add('externalUrls', externalUrls)
          ..add('externalIds', externalIds)
          ..add('isPlayable', isPlayable)
          ..add('previewUrl', previewUrl)
          ..add('trackNumber', trackNumber)
          ..add('isLocal', isLocal)
          ..add('id', id)
          ..add('uri', uri)
          ..add('artists', artists)
          ..add('album', album)
          ..add('href', href)
          ..add('started_at', started_at)
          ..add('current_playing', current_playing)
          ..add('cimavotos', cimavotos)
          ..add('baixavotos', baixavotos))
        .toString();
  }
}

class TrackBuilder implements Builder<Track, TrackBuilder> {
  _$Track _$v;

  int _discNumber;

  int get discNumber => _$this._discNumber;

  set discNumber(int discNumber) => _$this._discNumber = discNumber;

  int _popularity;

  int get popularity => _$this._popularity;

  set popularity(int popularity) => _$this._popularity = popularity;

  int _durationMs;

  int get durationMs => _$this._durationMs;

  set durationMs(int durationMs) => _$this._durationMs = durationMs;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  bool _explicit;

  bool get explicit => _$this._explicit;

  set explicit(bool explicit) => _$this._explicit = explicit;

  String _type;

  String get type => _$this._type;

  set type(String type) => _$this._type = type;

  ExternalUrlsBuilder _externalUrls;

  ExternalUrlsBuilder get externalUrls =>
      _$this._externalUrls ??= new ExternalUrlsBuilder();

  set externalUrls(ExternalUrlsBuilder externalUrls) =>
      _$this._externalUrls = externalUrls;

  ExternalIdsBuilder _externalIds;

  ExternalIdsBuilder get externalIds =>
      _$this._externalIds ??= new ExternalIdsBuilder();

  set externalIds(ExternalIdsBuilder externalIds) =>
      _$this._externalIds = externalIds;

  bool _isPlayable;

  bool get isPlayable => _$this._isPlayable;

  set isPlayable(bool isPlayable) => _$this._isPlayable = isPlayable;

  String _previewUrl;

  String get previewUrl => _$this._previewUrl;

  set previewUrl(String previewUrl) => _$this._previewUrl = previewUrl;

  int _trackNumber;

  int get trackNumber => _$this._trackNumber;

  set trackNumber(int trackNumber) => _$this._trackNumber = trackNumber;

  bool _isLocal;

  bool get isLocal => _$this._isLocal;

  set isLocal(bool isLocal) => _$this._isLocal = isLocal;

  String _id;

  String get id => _$this._id;

  set id(String id) => _$this._id = id;

  String _uri;

  String get uri => _$this._uri;

  set uri(String uri) => _$this._uri = uri;

  ListBuilder<Artist> _artists;

  ListBuilder<Artist> get artists =>
      _$this._artists ??= new ListBuilder<Artist>();

  set artists(ListBuilder<Artist> artists) => _$this._artists = artists;

  AlbumBuilder _album;

  AlbumBuilder get album => _$this._album ??= new AlbumBuilder();

  set album(AlbumBuilder album) => _$this._album = album;

  String _href;

  String get href => _$this._href;

  set href(String href) => _$this._href = href;

  String _started_at;

  String get started_at => _$this._started_at;

  set started_at(String started_at) => _$this._started_at = started_at;

  int _current_playing;

  int get current_playing => _$this._current_playing;

  set current_playing(int current_playing) =>
      _$this._current_playing = current_playing;

  int _cimavotos;

  int get cimavotos => _$this._cimavotos;

  set cimavotos(int cimavotos) => _$this._cimavotos = cimavotos;

  int _baixavotos;

  int get baixavotos => _$this._baixavotos;

  set baixavotos(int baixavotos) => _$this._baixavotos = baixavotos;

  TrackBuilder();

  TrackBuilder get _$this {
    if (_$v != null) {
      _discNumber = _$v.discNumber;
      _popularity = _$v.popularity;
      _durationMs = _$v.durationMs;
      _name = _$v.name;
      _explicit = _$v.explicit;
      _type = _$v.type;
      _externalUrls = _$v.externalUrls?.toBuilder();
      _externalIds = _$v.externalIds?.toBuilder();
      _isPlayable = _$v.isPlayable;
      _previewUrl = _$v.previewUrl;
      _trackNumber = _$v.trackNumber;
      _isLocal = _$v.isLocal;
      _id = _$v.id;
      _uri = _$v.uri;
      _artists = _$v.artists?.toBuilder();
      _album = _$v.album?.toBuilder();
      _href = _$v.href;
      _started_at = _$v.started_at;
      _current_playing = _$v.current_playing;
      _cimavotos = _$v.cimavotos;
      _baixavotos = _$v.baixavotos;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Track other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Track;
  }

  @override
  void update(void Function(TrackBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Track build() {
    _$Track _$result;
    try {
      _$result = _$v ??
          new _$Track._(
              discNumber: discNumber,
              popularity: popularity,
              durationMs: durationMs,
              name: name,
              explicit: explicit,
              type: type,
              externalUrls: _externalUrls?.build(),
              externalIds: _externalIds?.build(),
              isPlayable: isPlayable,
              previewUrl: previewUrl,
              trackNumber: trackNumber,
              isLocal: isLocal,
              id: id,
              uri: uri,
              artists: _artists?.build(),
              album: _album?.build(),
              href: href,
              started_at: started_at,
              current_playing: current_playing,
              cimavotos: cimavotos,
              baixavotos: baixavotos);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'externalUrls';
        _externalUrls?.build();
        _$failedField = 'externalIds';
        _externalIds?.build();

        _$failedField = 'artists';
        _artists?.build();
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Track', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
