// GENERATED CODE - DO NOT MODIFY BY HAND

part of bolha_membro;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BolhaMembro> _$bolhaMembroSerializer = new _$BolhaMembroSerializer();

class _$BolhaMembroSerializer implements StructuredSerializer<BolhaMembro> {
  @override
  final Iterable<Type> types = const [BolhaMembro, _$BolhaMembro];
  @override
  final String wireName = 'BolhaMembro';

  @override
  Iterable<Object> serialize(Serializers serializers, BolhaMembro object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.bolhaId != null) {
      result
        ..add('bolha_id')
        ..add(serializers.serialize(object.bolhaId,
            specifiedType: const FullType(int)));
    }
    if (object.userId != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.userId,
            specifiedType: const FullType(int)));
    }
    if (object.checkin != null) {
      result
        ..add('checkin')
        ..add(serializers.serialize(object.checkin,
            specifiedType: const FullType(String)));
    }
    if (object.checkout != null) {
      result
        ..add('checkout')
        ..add(serializers.serialize(object.checkout,
            specifiedType: const FullType(String)));
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
    if (object.latitude != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(object.latitude,
            specifiedType: const FullType(double)));
    }
    if (object.longitude != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(object.longitude,
            specifiedType: const FullType(double)));
    }
    if (object.me != null) {
      result
        ..add('me')
        ..add(serializers.serialize(object.me,
            specifiedType: const FullType(Me)));
    }
    return result;
  }

  @override
  BolhaMembro deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BolhaMembroBuilder();

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
        case 'bolha_id':
          result.bolhaId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'checkin':
          result.checkin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'checkout':
          result.checkout = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'me':
          result.me.replace(serializers.deserialize(value,
              specifiedType: const FullType(Me)) as Me);
          break;
      }
    }

    return result.build();
  }
}

class _$BolhaMembro extends BolhaMembro {
  @override
  final int id;
  @override
  final int bolhaId;
  @override
  final int userId;
  @override
  final String checkin;
  @override
  final String checkout;
  @override
  final String createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final Me me;

  factory _$BolhaMembro([void Function(BolhaMembroBuilder) updates]) =>
      (new BolhaMembroBuilder()..update(updates)).build();

  _$BolhaMembro._(
      {this.id,
      this.bolhaId,
      this.userId,
      this.checkin,
      this.checkout,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.latitude,
      this.longitude,
      this.me})
      : super._();

  @override
  BolhaMembro rebuild(void Function(BolhaMembroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BolhaMembroBuilder toBuilder() => new BolhaMembroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BolhaMembro &&
        id == other.id &&
        bolhaId == other.bolhaId &&
        userId == other.userId &&
        checkin == other.checkin &&
        checkout == other.checkout &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        me == other.me;
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
                                        $jc($jc(0, id.hashCode),
                                            bolhaId.hashCode),
                                        userId.hashCode),
                                    checkin.hashCode),
                                checkout.hashCode),
                            createdBy.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                latitude.hashCode),
            longitude.hashCode),
        me.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BolhaMembro')
          ..add('id', id)
          ..add('bolhaId', bolhaId)
          ..add('userId', userId)
          ..add('checkin', checkin)
          ..add('checkout', checkout)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('me', me))
        .toString();
  }
}

class BolhaMembroBuilder implements Builder<BolhaMembro, BolhaMembroBuilder> {
  _$BolhaMembro _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  int _bolhaId;

  int get bolhaId => _$this._bolhaId;

  set bolhaId(int bolhaId) => _$this._bolhaId = bolhaId;

  int _userId;

  int get userId => _$this._userId;

  set userId(int userId) => _$this._userId = userId;

  String _checkin;

  String get checkin => _$this._checkin;

  set checkin(String checkin) => _$this._checkin = checkin;

  String _checkout;

  String get checkout => _$this._checkout;

  set checkout(String checkout) => _$this._checkout = checkout;

  String _createdBy;

  String get createdBy => _$this._createdBy;

  set createdBy(String createdBy) => _$this._createdBy = createdBy;

  String _createdAt;

  String get createdAt => _$this._createdAt;

  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;

  String get updatedAt => _$this._updatedAt;

  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  double _latitude;

  double get latitude => _$this._latitude;

  set latitude(double latitude) => _$this._latitude = latitude;

  double _longitude;

  double get longitude => _$this._longitude;

  set longitude(double longitude) => _$this._longitude = longitude;

  MeBuilder _me;

  MeBuilder get me => _$this._me ??= new MeBuilder();

  set me(MeBuilder me) => _$this._me = me;

  BolhaMembroBuilder();

  BolhaMembroBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _bolhaId = _$v.bolhaId;
      _userId = _$v.userId;
      _checkin = _$v.checkin;
      _checkout = _$v.checkout;
      _createdBy = _$v.createdBy;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _me = _$v.me?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BolhaMembro other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BolhaMembro;
  }

  @override
  void update(void Function(BolhaMembroBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BolhaMembro build() {
    _$BolhaMembro _$result;
    try {
      _$result = _$v ??
          new _$BolhaMembro._(
              id: id,
              bolhaId: bolhaId,
              userId: userId,
              checkin: checkin,
              checkout: checkout,
              createdBy: createdBy,
              createdAt: createdAt,
              updatedAt: updatedAt,
              latitude: latitude,
              longitude: longitude,
              me: _me?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'me';
        _me?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BolhaMembro', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
