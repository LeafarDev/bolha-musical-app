// GENERATED CODE - DO NOT MODIFY BY HAND

part of bolha;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Bolha> _$bolhaSerializer = new _$BolhaSerializer();

class _$BolhaSerializer implements StructuredSerializer<Bolha> {
  @override
  final Iterable<Type> types = const [Bolha, _$Bolha];
  @override
  final String wireName = 'Bolha';

  @override
  Iterable<Object> serialize(Serializers serializers, Bolha object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'apelido',
      serializers.serialize(object.apelido,
          specifiedType: const FullType(String)),
    ];
    if (object.cor != null) {
      result
        ..add('cor')
        ..add(serializers.serialize(object.cor,
            specifiedType: const FullType(String)));
    }
    if (object.ehFixa != null) {
      result
        ..add('eh_fixa')
        ..add(serializers.serialize(object.ehFixa,
            specifiedType: const FullType(bool)));
    }
    if (object.userIdReferenciaRaio != null) {
      result
        ..add('user_id_referencia_raio')
        ..add(serializers.serialize(object.userIdReferenciaRaio,
            specifiedType: const FullType(int)));
    }
    if (object.latitude != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(object.latitude,
            specifiedType: const FullType(double)));
    }
    if (object.raio != null) {
      result
        ..add('raio')
        ..add(serializers.serialize(object.raio,
            specifiedType: const FullType(double)));
    }
    if (object.longitude != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(object.longitude,
            specifiedType: const FullType(double)));
    }
    if (object.distancia_metros != null) {
      result
        ..add('distancia_metros')
        ..add(serializers.serialize(object.distancia_metros,
            specifiedType: const FullType(double)));
    }
    if (object.userLiderId != null) {
      result
        ..add('user_lider_id')
        ..add(serializers.serialize(object.userLiderId,
            specifiedType: const FullType(int)));
    }
    if (object.createdBy != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(object.createdBy,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(String)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.bolhaId != null) {
      result
        ..add('bolha_id')
        ..add(serializers.serialize(object.bolhaId,
            specifiedType: const FullType(int)));
    }
    if (object.membros != null) {
      result
        ..add('membros')
        ..add(serializers.serialize(object.membros,
            specifiedType: const FullType(
                BuiltList, const [const FullType(BolhaMembro)])));
    }
    if (object.lider != null) {
      result
        ..add('lider')
        ..add(serializers.serialize(object.lider,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  Bolha deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BolhaBuilder();

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
        case 'apelido':
          result.apelido = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cor':
          result.cor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'eh_fixa':
          result.ehFixa = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user_id_referencia_raio':
          result.userIdReferenciaRaio = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'raio':
          result.raio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'distancia_metros':
          result.distancia_metros = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'user_lider_id':
          result.userLiderId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bolha_id':
          result.bolhaId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'membros':
          result.membros.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BolhaMembro)]))
              as BuiltList<dynamic>);
          break;
        case 'lider':
          result.lider.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
      }
    }

    return result.build();
  }
}

class _$Bolha extends Bolha {
  @override
  final int id;
  @override
  final String apelido;
  @override
  final String cor;
  @override
  final bool ehFixa;
  @override
  final int userIdReferenciaRaio;
  @override
  final double latitude;
  @override
  final double raio;
  @override
  final double longitude;
  @override
  final double distancia_metros;
  @override
  final int userLiderId;
  @override
  final String createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int bolhaId;
  @override
  final BuiltList<BolhaMembro> membros;
  @override
  final User lider;

  factory _$Bolha([void Function(BolhaBuilder) updates]) =>
      (new BolhaBuilder()..update(updates)).build();

  _$Bolha._(
      {this.id,
      this.apelido,
      this.cor,
      this.ehFixa,
      this.userIdReferenciaRaio,
      this.latitude,
      this.raio,
      this.longitude,
      this.distancia_metros,
      this.userLiderId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.bolhaId,
      this.membros,
      this.lider})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Bolha', 'id');
    }
    if (apelido == null) {
      throw new BuiltValueNullFieldError('Bolha', 'apelido');
    }
  }

  @override
  Bolha rebuild(void Function(BolhaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BolhaBuilder toBuilder() => new BolhaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bolha &&
        id == other.id &&
        apelido == other.apelido &&
        cor == other.cor &&
        ehFixa == other.ehFixa &&
        userIdReferenciaRaio == other.userIdReferenciaRaio &&
        latitude == other.latitude &&
        raio == other.raio &&
        longitude == other.longitude &&
        distancia_metros == other.distancia_metros &&
        userLiderId == other.userLiderId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        bolhaId == other.bolhaId &&
        membros == other.membros &&
        lider == other.lider;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    id
                                                                        .hashCode),
                                                                apelido
                                                                    .hashCode),
                                                            cor.hashCode),
                                                        ehFixa.hashCode),
                                                    userIdReferenciaRaio
                                                        .hashCode),
                                                latitude.hashCode),
                                            raio.hashCode),
                                        longitude.hashCode),
                                    distancia_metros.hashCode),
                                userLiderId.hashCode),
                            createdBy.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                bolhaId.hashCode),
            membros.hashCode),
        lider.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Bolha')
          ..add('id', id)
          ..add('apelido', apelido)
          ..add('cor', cor)
          ..add('ehFixa', ehFixa)
          ..add('userIdReferenciaRaio', userIdReferenciaRaio)
          ..add('latitude', latitude)
          ..add('raio', raio)
          ..add('longitude', longitude)
          ..add('distancia_metros', distancia_metros)
          ..add('userLiderId', userLiderId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('bolhaId', bolhaId)
          ..add('membros', membros)
          ..add('lider', lider))
        .toString();
  }
}

class BolhaBuilder implements Builder<Bolha, BolhaBuilder> {
  _$Bolha _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _apelido;
  String get apelido => _$this._apelido;
  set apelido(String apelido) => _$this._apelido = apelido;

  String _cor;
  String get cor => _$this._cor;
  set cor(String cor) => _$this._cor = cor;

  bool _ehFixa;
  bool get ehFixa => _$this._ehFixa;
  set ehFixa(bool ehFixa) => _$this._ehFixa = ehFixa;

  int _userIdReferenciaRaio;
  int get userIdReferenciaRaio => _$this._userIdReferenciaRaio;
  set userIdReferenciaRaio(int userIdReferenciaRaio) =>
      _$this._userIdReferenciaRaio = userIdReferenciaRaio;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  double _raio;
  double get raio => _$this._raio;
  set raio(double raio) => _$this._raio = raio;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  double _distancia_metros;
  double get distancia_metros => _$this._distancia_metros;
  set distancia_metros(double distancia_metros) =>
      _$this._distancia_metros = distancia_metros;

  int _userLiderId;
  int get userLiderId => _$this._userLiderId;
  set userLiderId(int userLiderId) => _$this._userLiderId = userLiderId;

  String _createdBy;
  String get createdBy => _$this._createdBy;
  set createdBy(String createdBy) => _$this._createdBy = createdBy;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  int _bolhaId;
  int get bolhaId => _$this._bolhaId;
  set bolhaId(int bolhaId) => _$this._bolhaId = bolhaId;

  ListBuilder<BolhaMembro> _membros;
  ListBuilder<BolhaMembro> get membros =>
      _$this._membros ??= new ListBuilder<BolhaMembro>();
  set membros(ListBuilder<BolhaMembro> membros) => _$this._membros = membros;

  UserBuilder _lider;
  UserBuilder get lider => _$this._lider ??= new UserBuilder();
  set lider(UserBuilder lider) => _$this._lider = lider;

  BolhaBuilder();

  BolhaBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _apelido = _$v.apelido;
      _cor = _$v.cor;
      _ehFixa = _$v.ehFixa;
      _userIdReferenciaRaio = _$v.userIdReferenciaRaio;
      _latitude = _$v.latitude;
      _raio = _$v.raio;
      _longitude = _$v.longitude;
      _distancia_metros = _$v.distancia_metros;
      _userLiderId = _$v.userLiderId;
      _createdBy = _$v.createdBy;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _bolhaId = _$v.bolhaId;
      _membros = _$v.membros?.toBuilder();
      _lider = _$v.lider?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Bolha other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Bolha;
  }

  @override
  void update(void Function(BolhaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Bolha build() {
    _$Bolha _$result;
    try {
      _$result = _$v ??
          new _$Bolha._(
              id: id,
              apelido: apelido,
              cor: cor,
              ehFixa: ehFixa,
              userIdReferenciaRaio: userIdReferenciaRaio,
              latitude: latitude,
              raio: raio,
              longitude: longitude,
              distancia_metros: distancia_metros,
              userLiderId: userLiderId,
              createdBy: createdBy,
              createdAt: createdAt,
              updatedAt: updatedAt,
              bolhaId: bolhaId,
              membros: _membros?.build(),
              lider: _lider?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'membros';
        _membros?.build();
        _$failedField = 'lider';
        _lider?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Bolha', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
