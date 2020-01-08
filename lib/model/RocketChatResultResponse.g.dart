// GENERATED CODE - DO NOT MODIFY BY HAND

part of rocket_chat_result_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RocketChatResultResponse> _$rocketChatResultResponseSerializer =
    new _$RocketChatResultResponseSerializer();

class _$RocketChatResultResponseSerializer
    implements StructuredSerializer<RocketChatResultResponse> {
  @override
  final Iterable<Type> types = const [
    RocketChatResultResponse,
    _$RocketChatResultResponse
  ];
  @override
  final String wireName = 'RocketChatResultResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RocketChatResultResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.messages != null) {
      result
        ..add('messages')
        ..add(serializers.serialize(object.messages,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Message)])));
    }
    return result;
  }

  @override
  RocketChatResultResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RocketChatResultResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Message)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$RocketChatResultResponse extends RocketChatResultResponse {
  @override
  final BuiltList<Message> messages;

  factory _$RocketChatResultResponse(
          [void Function(RocketChatResultResponseBuilder) updates]) =>
      (new RocketChatResultResponseBuilder()..update(updates)).build();

  _$RocketChatResultResponse._({this.messages}) : super._();

  @override
  RocketChatResultResponse rebuild(
          void Function(RocketChatResultResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RocketChatResultResponseBuilder toBuilder() =>
      new RocketChatResultResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RocketChatResultResponse && messages == other.messages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, messages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RocketChatResultResponse')
          ..add('messages', messages))
        .toString();
  }
}

class RocketChatResultResponseBuilder
    implements
        Builder<RocketChatResultResponse, RocketChatResultResponseBuilder> {
  _$RocketChatResultResponse _$v;

  ListBuilder<Message> _messages;
  ListBuilder<Message> get messages =>
      _$this._messages ??= new ListBuilder<Message>();
  set messages(ListBuilder<Message> messages) => _$this._messages = messages;

  RocketChatResultResponseBuilder();

  RocketChatResultResponseBuilder get _$this {
    if (_$v != null) {
      _messages = _$v.messages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RocketChatResultResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RocketChatResultResponse;
  }

  @override
  void update(void Function(RocketChatResultResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RocketChatResultResponse build() {
    _$RocketChatResultResponse _$result;
    try {
      _$result =
          _$v ?? new _$RocketChatResultResponse._(messages: _messages?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RocketChatResultResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
