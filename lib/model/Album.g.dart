// GENERATED CODE - DO NOT MODIFY BY HAND

part of album;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Album> _$albumSerializer = new _$AlbumSerializer();

class _$AlbumSerializer implements StructuredSerializer<Album> {
  @override
  final Iterable<Type> types = const [Album, _$Album];
  @override
  final String wireName = 'Album';

  @override
  Iterable<Object> serialize(Serializers serializers, Album object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.albumType != null) {
      result
        ..add('album_type')
        ..add(serializers.serialize(object.albumType,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDate != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(object.releaseDate,
            specifiedType: const FullType(String)));
    }
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SpotifyImage)])));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDatePrecision != null) {
      result
        ..add('release_date_precision')
        ..add(serializers.serialize(object.releaseDatePrecision,
            specifiedType: const FullType(String)));
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
    if (object.totalTracks != null) {
      result
        ..add('total_tracks')
        ..add(serializers.serialize(object.totalTracks,
            specifiedType: const FullType(int)));
    }
    if (object.href != null) {
      result
        ..add('href')
        ..add(serializers.serialize(object.href,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Album deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'album_type':
          result.albumType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SpotifyImage)]))
              as BuiltList<dynamic>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date_precision':
          result.releaseDatePrecision = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'external_urls':
          result.externalUrls.replace(serializers.deserialize(value,
              specifiedType: const FullType(ExternalUrls)) as ExternalUrls);
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
        case 'total_tracks':
          result.totalTracks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Album extends Album {
  @override
  final String albumType;
  @override
  final String releaseDate;
  @override
  final BuiltList<SpotifyImage> images;
  @override
  final String name;
  @override
  final String releaseDatePrecision;
  @override
  final String type;
  @override
  final ExternalUrls externalUrls;
  @override
  final String id;
  @override
  final String uri;
  @override
  final BuiltList<Artist> artists;
  @override
  final int totalTracks;
  @override
  final String href;

  factory _$Album([void Function(AlbumBuilder) updates]) =>
      (new AlbumBuilder()..update(updates)).build();

  _$Album._(
      {this.albumType,
      this.releaseDate,
      this.images,
      this.name,
      this.releaseDatePrecision,
      this.type,
      this.externalUrls,
      this.id,
      this.uri,
      this.artists,
      this.totalTracks,
      this.href})
      : super._();

  @override
  Album rebuild(void Function(AlbumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumBuilder toBuilder() => new AlbumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Album &&
        albumType == other.albumType &&
        releaseDate == other.releaseDate &&
        images == other.images &&
        name == other.name &&
        releaseDatePrecision == other.releaseDatePrecision &&
        type == other.type &&
        externalUrls == other.externalUrls &&
        id == other.id &&
        uri == other.uri &&
        artists == other.artists &&
        totalTracks == other.totalTracks &&
        href == other.href;
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
                                            $jc($jc(0, albumType.hashCode),
                                                releaseDate.hashCode),
                                            images.hashCode),
                                        name.hashCode),
                                    releaseDatePrecision.hashCode),
                                type.hashCode),
                            externalUrls.hashCode),
                        id.hashCode),
                    uri.hashCode),
                artists.hashCode),
            totalTracks.hashCode),
        href.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Album')
          ..add('albumType', albumType)
          ..add('releaseDate', releaseDate)
          ..add('images', images)
          ..add('name', name)
          ..add('releaseDatePrecision', releaseDatePrecision)
          ..add('type', type)
          ..add('externalUrls', externalUrls)
          ..add('id', id)
          ..add('uri', uri)
          ..add('artists', artists)
          ..add('totalTracks', totalTracks)
          ..add('href', href))
        .toString();
  }
}

class AlbumBuilder implements Builder<Album, AlbumBuilder> {
  _$Album _$v;

  String _albumType;

  String get albumType => _$this._albumType;

  set albumType(String albumType) => _$this._albumType = albumType;

  String _releaseDate;

  String get releaseDate => _$this._releaseDate;

  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  ListBuilder<SpotifyImage> _images;

  ListBuilder<SpotifyImage> get images =>
      _$this._images ??= new ListBuilder<SpotifyImage>();

  set images(ListBuilder<SpotifyImage> images) => _$this._images = images;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  String _releaseDatePrecision;

  String get releaseDatePrecision => _$this._releaseDatePrecision;

  set releaseDatePrecision(String releaseDatePrecision) =>
      _$this._releaseDatePrecision = releaseDatePrecision;

  String _type;

  String get type => _$this._type;

  set type(String type) => _$this._type = type;

  ExternalUrlsBuilder _externalUrls;

  ExternalUrlsBuilder get externalUrls =>
      _$this._externalUrls ??= new ExternalUrlsBuilder();

  set externalUrls(ExternalUrlsBuilder externalUrls) =>
      _$this._externalUrls = externalUrls;

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

  int _totalTracks;

  int get totalTracks => _$this._totalTracks;

  set totalTracks(int totalTracks) => _$this._totalTracks = totalTracks;

  String _href;

  String get href => _$this._href;

  set href(String href) => _$this._href = href;

  AlbumBuilder();

  AlbumBuilder get _$this {
    if (_$v != null) {
      _albumType = _$v.albumType;
      _releaseDate = _$v.releaseDate;
      _images = _$v.images?.toBuilder();
      _name = _$v.name;
      _releaseDatePrecision = _$v.releaseDatePrecision;
      _type = _$v.type;
      _externalUrls = _$v.externalUrls?.toBuilder();
      _id = _$v.id;
      _uri = _$v.uri;
      _artists = _$v.artists?.toBuilder();
      _totalTracks = _$v.totalTracks;
      _href = _$v.href;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Album other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Album;
  }

  @override
  void update(void Function(AlbumBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Album build() {
    _$Album _$result;
    try {
      _$result = _$v ??
          new _$Album._(
              albumType: albumType,
              releaseDate: releaseDate,
              images: _images?.build(),
              name: name,
              releaseDatePrecision: releaseDatePrecision,
              type: type,
              externalUrls: _externalUrls?.build(),
              id: id,
              uri: uri,
              artists: _artists?.build(),
              totalTracks: totalTracks,
              href: href);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'externalUrls';
        _externalUrls?.build();

        _$failedField = 'artists';
        _artists?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Album', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
