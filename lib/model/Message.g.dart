// GENERATED CODE - DO NOT MODIFY BY HAND

part of root_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Message> _$messageSerializer = new _$MessageSerializer();

class _$MessageSerializer implements StructuredSerializer<Message> {
  @override
  final Iterable<Type> types = const [Message, _$Message];
  @override
  final String wireName = 'Message';

  @override
  Iterable<Object> serialize(Serializers serializers, Message object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.rid != null) {
      result
        ..add('rid')
        ..add(serializers.serialize(object.rid,
            specifiedType: const FullType(String)));
    }
    if (object.msg != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(object.msg,
            specifiedType: const FullType(String)));
    }
    if (object.ts != null) {
      result
        ..add('ts')
        ..add(serializers.serialize(object.ts,
            specifiedType: const FullType(Ts)));
    }
    if (object.u != null) {
      result
        ..add('u')
        ..add(
            serializers.serialize(object.u, specifiedType: const FullType(U)));
    }
    if (object.groupable != null) {
      result
        ..add('groupable')
        ..add(serializers.serialize(object.groupable,
            specifiedType: const FullType(bool)));
    }
    if (object.updatedAt != null) {
      result
        ..add('_updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(UpdatedAt)));
    }
    return result;
  }

  @override
  Message deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageBuilder();

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
        case 'rid':
          result.rid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ts':
          result.ts.replace(serializers.deserialize(value,
              specifiedType: const FullType(Ts)) as Ts);
          break;
        case 'u':
          result.u.replace(serializers.deserialize(value,
              specifiedType: const FullType(U)) as U);
          break;
        case 'groupable':
          result.groupable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case '_updatedAt':
          result.updatedAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(UpdatedAt)) as UpdatedAt);
          break;
      }
    }

    return result.build();
  }
}

class _$Message extends Message {
  @override
  final String id;
  @override
  final String rid;
  @override
  final String msg;
  @override
  final Ts ts;
  @override
  final U u;
  @override
  final bool groupable;
  @override
  final UpdatedAt updatedAt;

  factory _$Message([void Function(MessageBuilder) updates]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._(
      {this.id,
      this.rid,
      this.msg,
      this.ts,
      this.u,
      this.groupable,
      this.updatedAt})
      : super._();

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        rid == other.rid &&
        msg == other.msg &&
        ts == other.ts &&
        u == other.u &&
        groupable == other.groupable &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc($jc(0, id.hashCode), rid.hashCode), msg.hashCode),
                    ts.hashCode),
                u.hashCode),
            groupable.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('id', id)
          ..add('rid', rid)
          ..add('msg', msg)
          ..add('ts', ts)
          ..add('u', u)
          ..add('groupable', groupable)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _rid;
  String get rid => _$this._rid;
  set rid(String rid) => _$this._rid = rid;

  String _msg;
  String get msg => _$this._msg;
  set msg(String msg) => _$this._msg = msg;

  TsBuilder _ts;
  TsBuilder get ts => _$this._ts ??= new TsBuilder();
  set ts(TsBuilder ts) => _$this._ts = ts;

  UBuilder _u;
  UBuilder get u => _$this._u ??= new UBuilder();
  set u(UBuilder u) => _$this._u = u;

  bool _groupable;
  bool get groupable => _$this._groupable;
  set groupable(bool groupable) => _$this._groupable = groupable;

  UpdatedAtBuilder _updatedAt;
  UpdatedAtBuilder get updatedAt =>
      _$this._updatedAt ??= new UpdatedAtBuilder();
  set updatedAt(UpdatedAtBuilder updatedAt) => _$this._updatedAt = updatedAt;

  MessageBuilder();

  MessageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _rid = _$v.rid;
      _msg = _$v.msg;
      _ts = _$v.ts?.toBuilder();
      _u = _$v.u?.toBuilder();
      _groupable = _$v.groupable;
      _updatedAt = _$v.updatedAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Message build() {
    _$Message _$result;
    try {
      _$result = _$v ??
          new _$Message._(
              id: id,
              rid: rid,
              msg: msg,
              ts: _ts?.build(),
              u: _u?.build(),
              groupable: groupable,
              updatedAt: _updatedAt?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ts';
        _ts?.build();
        _$failedField = 'u';
        _u?.build();

        _$failedField = 'updatedAt';
        _updatedAt?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Message', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
