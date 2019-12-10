// GENERATED CODE - DO NOT MODIFY BY HAND

part of external_ids;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExternalIds> _$externalIdsSerializer = new _$ExternalIdsSerializer();

class _$ExternalIdsSerializer implements StructuredSerializer<ExternalIds> {
  @override
  final Iterable<Type> types = const [ExternalIds, _$ExternalIds];
  @override
  final String wireName = 'ExternalIds';

  @override
  Iterable<Object> serialize(Serializers serializers, ExternalIds object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isrc',
      serializers.serialize(object.isrc, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ExternalIds deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExternalIdsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isrc':
          result.isrc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ExternalIds extends ExternalIds {
  @override
  final String isrc;

  factory _$ExternalIds([void Function(ExternalIdsBuilder) updates]) =>
      (new ExternalIdsBuilder()..update(updates)).build();

  _$ExternalIds._({this.isrc}) : super._() {
    if (isrc == null) {
      throw new BuiltValueNullFieldError('ExternalIds', 'isrc');
    }
  }

  @override
  ExternalIds rebuild(void Function(ExternalIdsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExternalIdsBuilder toBuilder() => new ExternalIdsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExternalIds && isrc == other.isrc;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isrc.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExternalIds')..add('isrc', isrc))
        .toString();
  }
}

class ExternalIdsBuilder implements Builder<ExternalIds, ExternalIdsBuilder> {
  _$ExternalIds _$v;

  String _isrc;
  String get isrc => _$this._isrc;
  set isrc(String isrc) => _$this._isrc = isrc;

  ExternalIdsBuilder();

  ExternalIdsBuilder get _$this {
    if (_$v != null) {
      _isrc = _$v.isrc;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExternalIds other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExternalIds;
  }

  @override
  void update(void Function(ExternalIdsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExternalIds build() {
    final _$result = _$v ?? new _$ExternalIds._(isrc: isrc);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
