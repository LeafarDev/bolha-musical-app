// GENERATED CODE - DO NOT MODIFY BY HAND

part of image_user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserImage> _$userImageSerializer = new _$UserImageSerializer();

class _$UserImageSerializer implements StructuredSerializer<UserImage> {
  @override
  final Iterable<Type> types = const [UserImage, _$UserImage];
  @override
  final String wireName = 'UserImage';

  @override
  Iterable<Object> serialize(Serializers serializers, UserImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.height != null) {
      result
        ..add('height')
        ..add(serializers.serialize(object.height,
            specifiedType: const FullType(String)));
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
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserImage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserImage extends UserImage {
  @override
  final String height;
  @override
  final String url;
  @override
  final String width;

  factory _$UserImage([void Function(UserImageBuilder) updates]) =>
      (new UserImageBuilder()..update(updates)).build();

  _$UserImage._({this.height, this.url, this.width}) : super._();

  @override
  UserImage rebuild(void Function(UserImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserImageBuilder toBuilder() => new UserImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserImage &&
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
    return (newBuiltValueToStringHelper('UserImage')
          ..add('height', height)
          ..add('url', url)
          ..add('width', width))
        .toString();
  }
}

class UserImageBuilder implements Builder<UserImage, UserImageBuilder> {
  _$UserImage _$v;

  String _height;

  String get height => _$this._height;

  set height(String height) => _$this._height = height;

  String _url;

  String get url => _$this._url;

  set url(String url) => _$this._url = url;

  String _width;

  String get width => _$this._width;

  set width(String width) => _$this._width = width;

  UserImageBuilder();

  UserImageBuilder get _$this {
    if (_$v != null) {
      _height = _$v.height;
      _url = _$v.url;
      _width = _$v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserImage;
  }

  @override
  void update(void Function(UserImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserImage build() {
    final _$result =
        _$v ?? new _$UserImage._(height: height, url: url, width: width);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
