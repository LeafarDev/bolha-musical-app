// GENERATED CODE - DO NOT MODIFY BY HAND

part of external_urls;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExternalUrls> _$externalUrlsSerializer =
    new _$ExternalUrlsSerializer();

class _$ExternalUrlsSerializer implements StructuredSerializer<ExternalUrls> {
  @override
  final Iterable<Type> types = const [ExternalUrls, _$ExternalUrls];
  @override
  final String wireName = 'ExternalUrls';

  @override
  Iterable<Object> serialize(Serializers serializers, ExternalUrls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.spotify != null) {
      result
        ..add('spotify')
        ..add(serializers.serialize(object.spotify,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ExternalUrls deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExternalUrlsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'spotify':
          result.spotify = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ExternalUrls extends ExternalUrls {
  @override
  final String spotify;

  factory _$ExternalUrls([void Function(ExternalUrlsBuilder) updates]) =>
      (new ExternalUrlsBuilder()..update(updates)).build();

  _$ExternalUrls._({this.spotify}) : super._();

  @override
  ExternalUrls rebuild(void Function(ExternalUrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExternalUrlsBuilder toBuilder() => new ExternalUrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExternalUrls && spotify == other.spotify;
  }

  @override
  int get hashCode {
    return $jf($jc(0, spotify.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExternalUrls')
          ..add('spotify', spotify))
        .toString();
  }
}

class ExternalUrlsBuilder
    implements Builder<ExternalUrls, ExternalUrlsBuilder> {
  _$ExternalUrls _$v;

  String _spotify;

  String get spotify => _$this._spotify;

  set spotify(String spotify) => _$this._spotify = spotify;

  ExternalUrlsBuilder();

  ExternalUrlsBuilder get _$this {
    if (_$v != null) {
      _spotify = _$v.spotify;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExternalUrls other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExternalUrls;
  }

  @override
  void update(void Function(ExternalUrlsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExternalUrls build() {
    final _$result = _$v ?? new _$ExternalUrls._(spotify: spotify);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
