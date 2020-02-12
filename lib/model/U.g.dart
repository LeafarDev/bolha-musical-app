// GENERATED CODE - DO NOT MODIFY BY HAND

part of u;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<U> _$uSerializer = new _$USerializer();

class _$USerializer implements StructuredSerializer<U> {
  @override
  final Iterable<Type> types = const [U, _$U];
  @override
  final String wireName = 'U';

  @override
  Iterable<Object> serialize(Serializers serializers, U object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  U deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$U extends U {
  @override
  final String id;
  @override
  final String username;
  @override
  final String name;

  factory _$U([void Function(UBuilder) updates]) =>
      (new UBuilder()..update(updates)).build();

  _$U._({this.id, this.username, this.name}) : super._();

  @override
  U rebuild(void Function(UBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UBuilder toBuilder() => new UBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is U &&
        id == other.id &&
        username == other.username &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), username.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('U')
          ..add('id', id)
          ..add('username', username)
          ..add('name', name))
        .toString();
  }
}

class UBuilder implements Builder<U, UBuilder> {
  _$U _$v;

  String _id;

  String get id => _$this._id;

  set id(String id) => _$this._id = id;

  String _username;

  String get username => _$this._username;

  set username(String username) => _$this._username = username;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  UBuilder();

  UBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _username = _$v.username;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(U other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$U;
  }

  @override
  void update(void Function(UBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$U build() {
    final _$result = _$v ?? new _$U._(id: id, username: username, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
