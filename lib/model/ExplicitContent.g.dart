// GENERATED CODE - DO NOT MODIFY BY HAND

part of explicit_content;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExplicitContent> _$explicitContentSerializer =
    new _$ExplicitContentSerializer();

class _$ExplicitContentSerializer
    implements StructuredSerializer<ExplicitContent> {
  @override
  final Iterable<Type> types = const [ExplicitContent, _$ExplicitContent];
  @override
  final String wireName = 'ExplicitContent';

  @override
  Iterable<Object> serialize(Serializers serializers, ExplicitContent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'filter_enabled',
      serializers.serialize(object.filterEnabled,
          specifiedType: const FullType(bool)),
      'filter_locked',
      serializers.serialize(object.filterLocked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ExplicitContent deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExplicitContentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'filter_enabled':
          result.filterEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'filter_locked':
          result.filterLocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ExplicitContent extends ExplicitContent {
  @override
  final bool filterEnabled;
  @override
  final bool filterLocked;

  factory _$ExplicitContent([void Function(ExplicitContentBuilder) updates]) =>
      (new ExplicitContentBuilder()..update(updates)).build();

  _$ExplicitContent._({this.filterEnabled, this.filterLocked}) : super._() {
    if (filterEnabled == null) {
      throw new BuiltValueNullFieldError('ExplicitContent', 'filterEnabled');
    }
    if (filterLocked == null) {
      throw new BuiltValueNullFieldError('ExplicitContent', 'filterLocked');
    }
  }

  @override
  ExplicitContent rebuild(void Function(ExplicitContentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExplicitContentBuilder toBuilder() =>
      new ExplicitContentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExplicitContent &&
        filterEnabled == other.filterEnabled &&
        filterLocked == other.filterLocked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, filterEnabled.hashCode), filterLocked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExplicitContent')
          ..add('filterEnabled', filterEnabled)
          ..add('filterLocked', filterLocked))
        .toString();
  }
}

class ExplicitContentBuilder
    implements Builder<ExplicitContent, ExplicitContentBuilder> {
  _$ExplicitContent _$v;

  bool _filterEnabled;

  bool get filterEnabled => _$this._filterEnabled;

  set filterEnabled(bool filterEnabled) =>
      _$this._filterEnabled = filterEnabled;

  bool _filterLocked;

  bool get filterLocked => _$this._filterLocked;

  set filterLocked(bool filterLocked) => _$this._filterLocked = filterLocked;

  ExplicitContentBuilder();

  ExplicitContentBuilder get _$this {
    if (_$v != null) {
      _filterEnabled = _$v.filterEnabled;
      _filterLocked = _$v.filterLocked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplicitContent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExplicitContent;
  }

  @override
  void update(void Function(ExplicitContentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExplicitContent build() {
    final _$result = _$v ??
        new _$ExplicitContent._(
            filterEnabled: filterEnabled, filterLocked: filterLocked);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
