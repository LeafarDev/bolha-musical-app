// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.isActive != null) {
      result
        ..add('is_active')
        ..add(serializers.serialize(object.isActive,
            specifiedType: const FullType(int)));
    }
    if (object.spotifyClientId != null) {
      result
        ..add('spotify_client_id')
        ..add(serializers.serialize(object.spotifyClientId,
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
    if (object.dataUltimaLocalizacao != null) {
      result
        ..add('data_ultima_localizacao')
        ..add(serializers.serialize(object.dataUltimaLocalizacao,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_active':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'spotify_client_id':
          result.spotifyClientId = serializers.deserialize(value,
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
        case 'data_ultima_localizacao':
          result.dataUltimaLocalizacao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final int id;
  @override
  final String email;
  @override
  final int isActive;
  @override
  final String spotifyClientId;
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
  final String dataUltimaLocalizacao;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.email,
      this.isActive,
      this.spotifyClientId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.latitude,
      this.longitude,
      this.dataUltimaLocalizacao})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        email == other.email &&
        isActive == other.isActive &&
        spotifyClientId == other.spotifyClientId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        dataUltimaLocalizacao == other.dataUltimaLocalizacao;
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
                                $jc($jc($jc(0, id.hashCode), email.hashCode),
                                    isActive.hashCode),
                                spotifyClientId.hashCode),
                            createdBy.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                latitude.hashCode),
            longitude.hashCode),
        dataUltimaLocalizacao.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('email', email)
          ..add('isActive', isActive)
          ..add('spotifyClientId', spotifyClientId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('dataUltimaLocalizacao', dataUltimaLocalizacao))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _email;

  String get email => _$this._email;

  set email(String email) => _$this._email = email;

  int _isActive;

  int get isActive => _$this._isActive;

  set isActive(int isActive) => _$this._isActive = isActive;

  String _spotifyClientId;

  String get spotifyClientId => _$this._spotifyClientId;

  set spotifyClientId(String spotifyClientId) =>
      _$this._spotifyClientId = spotifyClientId;

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

  String _dataUltimaLocalizacao;

  String get dataUltimaLocalizacao => _$this._dataUltimaLocalizacao;

  set dataUltimaLocalizacao(String dataUltimaLocalizacao) =>
      _$this._dataUltimaLocalizacao = dataUltimaLocalizacao;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _email = _$v.email;
      _isActive = _$v.isActive;
      _spotifyClientId = _$v.spotifyClientId;
      _createdBy = _$v.createdBy;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _dataUltimaLocalizacao = _$v.dataUltimaLocalizacao;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            id: id,
            email: email,
            isActive: isActive,
            spotifyClientId: spotifyClientId,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            latitude: latitude,
            longitude: longitude,
            dataUltimaLocalizacao: dataUltimaLocalizacao);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
