// GENERATED CODE - DO NOT MODIFY BY HAND

part of referencia_tamanho_bolha;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReferenciaTamanhoBolha> _$referenciaTamanhoBolhaSerializer =
    new _$ReferenciaTamanhoBolhaSerializer();

class _$ReferenciaTamanhoBolhaSerializer
    implements StructuredSerializer<ReferenciaTamanhoBolha> {
  @override
  final Iterable<Type> types = const [
    ReferenciaTamanhoBolha,
    _$ReferenciaTamanhoBolha
  ];
  @override
  final String wireName = 'ReferenciaTamanhoBolha';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ReferenciaTamanhoBolha object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    if (object.raioMetros != null) {
      result
        ..add('raio_metros')
        ..add(serializers.serialize(object.raioMetros,
            specifiedType: const FullType(double)));
    }
    if (object.min != null) {
      result
        ..add('min')
        ..add(serializers.serialize(object.min,
            specifiedType: const FullType(int)));
    }
    if (object.max != null) {
      result
        ..add('max')
        ..add(serializers.serialize(object.max,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ReferenciaTamanhoBolha deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReferenciaTamanhoBolhaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'raio_metros':
          result.raioMetros = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'min':
          result.min = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'max':
          result.max = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ReferenciaTamanhoBolha extends ReferenciaTamanhoBolha {
  @override
  final int id;
  @override
  final double raioMetros;
  @override
  final int min;
  @override
  final int max;

  factory _$ReferenciaTamanhoBolha(
          [void Function(ReferenciaTamanhoBolhaBuilder) updates]) =>
      (new ReferenciaTamanhoBolhaBuilder()..update(updates)).build();

  _$ReferenciaTamanhoBolha._({this.id, this.raioMetros, this.min, this.max})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ReferenciaTamanhoBolha', 'id');
    }
  }

  @override
  ReferenciaTamanhoBolha rebuild(
          void Function(ReferenciaTamanhoBolhaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenciaTamanhoBolhaBuilder toBuilder() =>
      new ReferenciaTamanhoBolhaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenciaTamanhoBolha &&
        id == other.id &&
        raioMetros == other.raioMetros &&
        min == other.min &&
        max == other.max;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), raioMetros.hashCode), min.hashCode),
        max.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReferenciaTamanhoBolha')
          ..add('id', id)
          ..add('raioMetros', raioMetros)
          ..add('min', min)
          ..add('max', max))
        .toString();
  }
}

class ReferenciaTamanhoBolhaBuilder
    implements Builder<ReferenciaTamanhoBolha, ReferenciaTamanhoBolhaBuilder> {
  _$ReferenciaTamanhoBolha _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  double _raioMetros;
  double get raioMetros => _$this._raioMetros;
  set raioMetros(double raioMetros) => _$this._raioMetros = raioMetros;

  int _min;
  int get min => _$this._min;
  set min(int min) => _$this._min = min;

  int _max;
  int get max => _$this._max;
  set max(int max) => _$this._max = max;

  ReferenciaTamanhoBolhaBuilder();

  ReferenciaTamanhoBolhaBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _raioMetros = _$v.raioMetros;
      _min = _$v.min;
      _max = _$v.max;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReferenciaTamanhoBolha other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReferenciaTamanhoBolha;
  }

  @override
  void update(void Function(ReferenciaTamanhoBolhaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReferenciaTamanhoBolha build() {
    final _$result = _$v ??
        new _$ReferenciaTamanhoBolha._(
            id: id, raioMetros: raioMetros, min: min, max: max);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
