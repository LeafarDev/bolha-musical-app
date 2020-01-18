// GENERATED CODE - DO NOT MODIFY BY HAND

part of voto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Voto> _$votoSerializer = new _$VotoSerializer();

class _$VotoSerializer implements StructuredSerializer<Voto> {
  @override
  final Iterable<Type> types = const [Voto, _$Voto];
  @override
  final String wireName = 'Voto';

  @override
  Iterable<Object> serialize(Serializers serializers, Voto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.user_id != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.user_id,
            specifiedType: const FullType(int)));
    }
    if (object.trackInternoId != null) {
      result
        ..add('track_interno_id')
        ..add(serializers.serialize(object.trackInternoId,
            specifiedType: const FullType(int)));
    }
    if (object.cimavoto != null) {
      result
        ..add('cimavoto')
        ..add(serializers.serialize(object.cimavoto,
            specifiedType: const FullType(bool)));
    }
    if (object.refletirSpotify != null) {
      result
        ..add('refletir_spotify')
        ..add(serializers.serialize(object.refletirSpotify,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  Voto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VotoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'track_interno_id':
          result.trackInternoId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cimavoto':
          result.cimavoto = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'refletir_spotify':
          result.refletirSpotify = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Voto extends Voto {
  @override
  final int user_id;
  @override
  final int trackInternoId;
  @override
  final bool cimavoto;
  @override
  final bool refletirSpotify;

  factory _$Voto([void Function(VotoBuilder) updates]) =>
      (new VotoBuilder()..update(updates)).build();

  _$Voto._(
      {this.user_id, this.trackInternoId, this.cimavoto, this.refletirSpotify})
      : super._();

  @override
  Voto rebuild(void Function(VotoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VotoBuilder toBuilder() => new VotoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Voto &&
        user_id == other.user_id &&
        trackInternoId == other.trackInternoId &&
        cimavoto == other.cimavoto &&
        refletirSpotify == other.refletirSpotify;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, user_id.hashCode), trackInternoId.hashCode),
            cimavoto.hashCode),
        refletirSpotify.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Voto')
          ..add('user_id', user_id)
          ..add('trackInternoId', trackInternoId)
          ..add('cimavoto', cimavoto)
          ..add('refletirSpotify', refletirSpotify))
        .toString();
  }
}

class VotoBuilder implements Builder<Voto, VotoBuilder> {
  _$Voto _$v;

  int _user_id;
  int get user_id => _$this._user_id;
  set user_id(int user_id) => _$this._user_id = user_id;

  int _trackInternoId;
  int get trackInternoId => _$this._trackInternoId;
  set trackInternoId(int trackInternoId) =>
      _$this._trackInternoId = trackInternoId;

  bool _cimavoto;
  bool get cimavoto => _$this._cimavoto;
  set cimavoto(bool cimavoto) => _$this._cimavoto = cimavoto;

  bool _refletirSpotify;
  bool get refletirSpotify => _$this._refletirSpotify;
  set refletirSpotify(bool refletirSpotify) =>
      _$this._refletirSpotify = refletirSpotify;

  VotoBuilder();

  VotoBuilder get _$this {
    if (_$v != null) {
      _user_id = _$v.user_id;
      _trackInternoId = _$v.trackInternoId;
      _cimavoto = _$v.cimavoto;
      _refletirSpotify = _$v.refletirSpotify;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Voto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Voto;
  }

  @override
  void update(void Function(VotoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Voto build() {
    final _$result = _$v ??
        new _$Voto._(
            user_id: user_id,
            trackInternoId: trackInternoId,
            cimavoto: cimavoto,
            refletirSpotify: refletirSpotify);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
