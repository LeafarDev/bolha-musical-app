// GENERATED CODE - DO NOT MODIFY BY HAND

part of backend_message;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BackendMessage> _$backendMessageSerializer =
    new _$BackendMessageSerializer();

class _$BackendMessageSerializer
    implements StructuredSerializer<BackendMessage> {
  @override
  final Iterable<Type> types = const [BackendMessage, _$BackendMessage];
  @override
  final String wireName = 'BackendMessage';

  @override
  Iterable<Object> serialize(Serializers serializers, BackendMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BackendMessage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BackendMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BackendMessage extends BackendMessage {
  @override
  final String message;

  factory _$BackendMessage([void Function(BackendMessageBuilder) updates]) =>
      (new BackendMessageBuilder()..update(updates)).build();

  _$BackendMessage._({this.message}) : super._();

  @override
  BackendMessage rebuild(void Function(BackendMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BackendMessageBuilder toBuilder() =>
      new BackendMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BackendMessage && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BackendMessage')
          ..add('message', message))
        .toString();
  }
}

class BackendMessageBuilder
    implements Builder<BackendMessage, BackendMessageBuilder> {
  _$BackendMessage _$v;

  String _message;

  String get message => _$this._message;

  set message(String message) => _$this._message = message;

  BackendMessageBuilder();

  BackendMessageBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BackendMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BackendMessage;
  }

  @override
  void update(void Function(BackendMessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BackendMessage build() {
    final _$result = _$v ?? new _$BackendMessage._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
