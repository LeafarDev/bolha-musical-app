// GENERATED CODE - DO NOT MODIFY BY HAND

part of message;

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
    if (object.sender != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(object.sender,
            specifiedType: const FullType(Me)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    if (object.isLiked != null) {
      result
        ..add('isLiked')
        ..add(serializers.serialize(object.isLiked,
            specifiedType: const FullType(bool)));
    }
    if (object.unread != null) {
      result
        ..add('unread')
        ..add(serializers.serialize(object.unread,
            specifiedType: const FullType(bool)));
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
        case 'sender':
          result.sender.replace(serializers.deserialize(value,
              specifiedType: const FullType(Me)) as Me);
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'unread':
          result.unread = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Message extends Message {
  @override
  final Me sender;
  @override
  final String time;
  @override
  final String text;
  @override
  final bool isLiked;
  @override
  final bool unread;

  factory _$Message([void Function(MessageBuilder) updates]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._({this.sender, this.time, this.text, this.isLiked, this.unread})
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
        sender == other.sender &&
        time == other.time &&
        text == other.text &&
        isLiked == other.isLiked &&
        unread == other.unread;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, sender.hashCode), time.hashCode), text.hashCode),
            isLiked.hashCode),
        unread.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('sender', sender)
          ..add('time', time)
          ..add('text', text)
          ..add('isLiked', isLiked)
          ..add('unread', unread))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message _$v;

  MeBuilder _sender;

  MeBuilder get sender => _$this._sender ??= new MeBuilder();

  set sender(MeBuilder sender) => _$this._sender = sender;

  String _time;

  String get time => _$this._time;

  set time(String time) => _$this._time = time;

  String _text;

  String get text => _$this._text;

  set text(String text) => _$this._text = text;

  bool _isLiked;

  bool get isLiked => _$this._isLiked;

  set isLiked(bool isLiked) => _$this._isLiked = isLiked;

  bool _unread;

  bool get unread => _$this._unread;

  set unread(bool unread) => _$this._unread = unread;

  MessageBuilder();

  MessageBuilder get _$this {
    if (_$v != null) {
      _sender = _$v.sender?.toBuilder();
      _time = _$v.time;
      _text = _$v.text;
      _isLiked = _$v.isLiked;
      _unread = _$v.unread;
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
              sender: _sender?.build(),
              time: time,
              text: text,
              isLiked: isLiked,
              unread: unread);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sender';
        _sender?.build();
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
