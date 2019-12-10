// GENERATED CODE - DO NOT MODIFY BY HAND

part of image_user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SpotifyImage> _$spotifyImageSerializer =
    new _$SpotifyImageSerializer();

class _$SpotifyImageSerializer implements StructuredSerializer<SpotifyImage> {
  @override
  final Iterable<Type> types = const [SpotifyImage, _$SpotifyImage];
  @override
  final String wireName = 'SpotifyImage';

  @override
  Iterable<Object> serialize(Serializers serializers, SpotifyImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.height != null) {
      result
        ..add('height')
        ..add(serializers.serialize(object.height,
            specifiedType: const FullType(int)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.width != null) {
      result
        ..add('width')
        ..add(serializers.serialize(object.width,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  SpotifyImage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpotifyImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SpotifyImage extends SpotifyImage {
  @override
  final int height;
  @override
  final String url;
  @override
  final int width;

  factory _$SpotifyImage([void Function(SpotifyImageBuilder) updates]) =>
      (new SpotifyImageBuilder()..update(updates)).build();

  _$SpotifyImage._({this.height, this.url, this.width}) : super._();

  @override
  SpotifyImage rebuild(void Function(SpotifyImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpotifyImageBuilder toBuilder() => new SpotifyImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpotifyImage &&
        height == other.height &&
        url == other.url &&
        width == other.width;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, height.hashCode), url.hashCode), width.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SpotifyImage')
          ..add('height', height)
          ..add('url', url)
          ..add('width', width))
        .toString();
  }
}

class SpotifyImageBuilder
    implements Builder<SpotifyImage, SpotifyImageBuilder> {
  _$SpotifyImage _$v;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  SpotifyImageBuilder();

  SpotifyImageBuilder get _$this {
    if (_$v != null) {
      _height = _$v.height;
      _url = _$v.url;
      _width = _$v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpotifyImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SpotifyImage;
  }

  @override
  void update(void Function(SpotifyImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SpotifyImage build() {
    final _$result =
        _$v ?? new _$SpotifyImage._(height: height, url: url, width: width);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
