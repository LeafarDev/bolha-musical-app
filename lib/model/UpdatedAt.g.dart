// GENERATED CODE - DO NOT MODIFY BY HAND

part of updated_at;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdatedAt> _$updatedAtSerializer = new _$UpdatedAtSerializer();

class _$UpdatedAtSerializer implements StructuredSerializer<UpdatedAt> {
  @override
  final Iterable<Type> types = const [UpdatedAt, _$UpdatedAt];
  @override
  final String wireName = 'UpdatedAt';

  @override
  Iterable<Object> serialize(Serializers serializers, UpdatedAt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.$date != null) {
      result
        ..add('\$date')
        ..add(serializers.serialize(object.$date,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UpdatedAt deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdatedAtBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '\$date':
          result.$date = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdatedAt extends UpdatedAt {
  @override
  final int $date;

  factory _$UpdatedAt([void Function(UpdatedAtBuilder) updates]) =>
      (new UpdatedAtBuilder()..update(updates)).build();

  _$UpdatedAt._({this.$date}) : super._();

  @override
  UpdatedAt rebuild(void Function(UpdatedAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatedAtBuilder toBuilder() => new UpdatedAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatedAt && $date == other.$date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, $date.hashCode));
  }
}

class UpdatedAtBuilder implements Builder<UpdatedAt, UpdatedAtBuilder> {
  _$UpdatedAt _$v;

  int _$date;
  int get $date => _$this._$date;
  set $date(int $date) => _$this._$date = $date;

  UpdatedAtBuilder();

  UpdatedAtBuilder get _$this {
    if (_$v != null) {
      _$date = _$v.$date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdatedAt other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdatedAt;
  }

  @override
  void update(void Function(UpdatedAtBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdatedAt build() {
    final _$result = _$v ?? new _$UpdatedAt._($date: $date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
