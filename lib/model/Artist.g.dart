// GENERATED CODE - DO NOT MODIFY BY HAND

part of artists;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Artist> _$artistSerializer = new _$ArtistSerializer();

class _$ArtistSerializer implements StructuredSerializer<Artist> {
  @override
  final Iterable<Type> types = const [Artist, _$Artist];
  @override
  final String wireName = 'Artist';

  @override
  Iterable<Object> serialize(Serializers serializers, Artist object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'external_urls',
      serializers.serialize(object.externalUrls,
          specifiedType: const FullType(ExternalUrls)),
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Artist deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtistBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'external_urls':
          result.externalUrls.replace(serializers.deserialize(value,
              specifiedType: const FullType(ExternalUrls)) as ExternalUrls);
          break;
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Artist extends Artist {
  @override
  final ExternalUrls externalUrls;
  @override
  final String href;
  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String uri;

  factory _$Artist([void Function(ArtistBuilder) updates]) =>
      (new ArtistBuilder()..update(updates)).build();

  _$Artist._(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri})
      : super._() {
    if (externalUrls == null) {
      throw new BuiltValueNullFieldError('Artist', 'externalUrls');
    }
    if (href == null) {
      throw new BuiltValueNullFieldError('Artist', 'href');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Artist', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Artist', 'name');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Artist', 'type');
    }
    if (uri == null) {
      throw new BuiltValueNullFieldError('Artist', 'uri');
    }
  }

  @override
  Artist rebuild(void Function(ArtistBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtistBuilder toBuilder() => new ArtistBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Artist &&
        externalUrls == other.externalUrls &&
        href == other.href &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        uri == other.uri;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, externalUrls.hashCode), href.hashCode),
                    id.hashCode),
                name.hashCode),
            type.hashCode),
        uri.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Artist')
          ..add('externalUrls', externalUrls)
          ..add('href', href)
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('uri', uri))
        .toString();
  }
}

class ArtistBuilder implements Builder<Artist, ArtistBuilder> {
  _$Artist _$v;

  ExternalUrlsBuilder _externalUrls;

  ExternalUrlsBuilder get externalUrls =>
      _$this._externalUrls ??= new ExternalUrlsBuilder();

  set externalUrls(ExternalUrlsBuilder externalUrls) =>
      _$this._externalUrls = externalUrls;

  String _href;

  String get href => _$this._href;

  set href(String href) => _$this._href = href;

  String _id;

  String get id => _$this._id;

  set id(String id) => _$this._id = id;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  String _type;

  String get type => _$this._type;

  set type(String type) => _$this._type = type;

  String _uri;

  String get uri => _$this._uri;

  set uri(String uri) => _$this._uri = uri;

  ArtistBuilder();

  ArtistBuilder get _$this {
    if (_$v != null) {
      _externalUrls = _$v.externalUrls?.toBuilder();
      _href = _$v.href;
      _id = _$v.id;
      _name = _$v.name;
      _type = _$v.type;
      _uri = _$v.uri;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Artist other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Artist;
  }

  @override
  void update(void Function(ArtistBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Artist build() {
    _$Artist _$result;
    try {
      _$result = _$v ??
          new _$Artist._(
              externalUrls: externalUrls.build(),
              href: href,
              id: id,
              name: name,
              type: type,
              uri: uri);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'externalUrls';
        externalUrls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Artist', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
