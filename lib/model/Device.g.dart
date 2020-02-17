// GENERATED CODE - DO NOT MODIFY BY HAND

part of device;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Device> _$deviceSerializer = new _$DeviceSerializer();

class _$DeviceSerializer implements StructuredSerializer<Device> {
  @override
  final Iterable<Type> types = const [Device, _$Device];
  @override
  final String wireName = 'Device';

  @override
  Iterable<Object> serialize(Serializers serializers, Device object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.isActive != null) {
      result
        ..add('is_active')
        ..add(serializers.serialize(object.isActive,
            specifiedType: const FullType(bool)));
    }
    if (object.isPrivateSession != null) {
      result
        ..add('is_private_session')
        ..add(serializers.serialize(object.isPrivateSession,
            specifiedType: const FullType(bool)));
    }
    if (object.isRestricted != null) {
      result
        ..add('is_restricted')
        ..add(serializers.serialize(object.isRestricted,
            specifiedType: const FullType(bool)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.volumePercent != null) {
      result
        ..add('volume_percent')
        ..add(serializers.serialize(object.volumePercent,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Device deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_active':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_private_session':
          result.isPrivateSession = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_restricted':
          result.isRestricted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volume_percent':
          result.volumePercent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Device extends Device {
  @override
  final String id;
  @override
  final bool isActive;
  @override
  final bool isPrivateSession;
  @override
  final bool isRestricted;
  @override
  final String name;
  @override
  final String type;
  @override
  final int volumePercent;

  factory _$Device([void Function(DeviceBuilder) updates]) =>
      (new DeviceBuilder()..update(updates)).build();

  _$Device._(
      {this.id,
      this.isActive,
      this.isPrivateSession,
      this.isRestricted,
      this.name,
      this.type,
      this.volumePercent})
      : super._();

  @override
  Device rebuild(void Function(DeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceBuilder toBuilder() => new DeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Device &&
        id == other.id &&
        isActive == other.isActive &&
        isPrivateSession == other.isPrivateSession &&
        isRestricted == other.isRestricted &&
        name == other.name &&
        type == other.type &&
        volumePercent == other.volumePercent;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), isActive.hashCode),
                        isPrivateSession.hashCode),
                    isRestricted.hashCode),
                name.hashCode),
            type.hashCode),
        volumePercent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Device')
          ..add('id', id)
          ..add('isActive', isActive)
          ..add('isPrivateSession', isPrivateSession)
          ..add('isRestricted', isRestricted)
          ..add('name', name)
          ..add('type', type)
          ..add('volumePercent', volumePercent))
        .toString();
  }
}

class DeviceBuilder implements Builder<Device, DeviceBuilder> {
  _$Device _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _isActive;
  bool get isActive => _$this._isActive;
  set isActive(bool isActive) => _$this._isActive = isActive;

  bool _isPrivateSession;
  bool get isPrivateSession => _$this._isPrivateSession;
  set isPrivateSession(bool isPrivateSession) =>
      _$this._isPrivateSession = isPrivateSession;

  bool _isRestricted;
  bool get isRestricted => _$this._isRestricted;
  set isRestricted(bool isRestricted) => _$this._isRestricted = isRestricted;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  int _volumePercent;
  int get volumePercent => _$this._volumePercent;
  set volumePercent(int volumePercent) => _$this._volumePercent = volumePercent;

  DeviceBuilder();

  DeviceBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _isActive = _$v.isActive;
      _isPrivateSession = _$v.isPrivateSession;
      _isRestricted = _$v.isRestricted;
      _name = _$v.name;
      _type = _$v.type;
      _volumePercent = _$v.volumePercent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Device other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Device;
  }

  @override
  void update(void Function(DeviceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Device build() {
    final _$result = _$v ??
        new _$Device._(
            id: id,
            isActive: isActive,
            isPrivateSession: isPrivateSession,
            isRestricted: isRestricted,
            name: name,
            type: type,
            volumePercent: volumePercent);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
