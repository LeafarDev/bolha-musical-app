// GENERATED CODE - DO NOT MODIFY BY HAND

part of ts;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Ts> _$tsSerializer = new _$TsSerializer();

class _$TsSerializer implements StructuredSerializer<Ts> {
  @override
  final Iterable<Type> types = const [Ts, _$Ts];
  @override
  final String wireName = 'Ts';

  @override
  Iterable<Object> serialize(Serializers serializers, Ts object,
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
  Ts deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TsBuilder();

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

class _$Ts extends Ts {
  @override
  final int $date;

  factory _$Ts([void Function(TsBuilder) updates]) =>
      (new TsBuilder()..update(updates)).build();

  _$Ts._({this.$date}) : super._();

  @override
  Ts rebuild(void Function(TsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TsBuilder toBuilder() => new TsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ts && $date == other.$date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, $date.hashCode));
  }
}

class TsBuilder implements Builder<Ts, TsBuilder> {
  _$Ts _$v;

  int _$date;
  int get $date => _$this._$date;
  set $date(int $date) => _$this._$date = $date;

  TsBuilder();

  TsBuilder get _$this {
    if (_$v != null) {
      _$date = _$v.$date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Ts other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Ts;
  }

  @override
  void update(void Function(TsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Ts build() {
    final _$result = _$v ?? new _$Ts._($date: $date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
