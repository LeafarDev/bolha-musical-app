// GENERATED CODE - DO NOT MODIFY BY HAND

part of rocket_chat_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RocketChatResponse> _$rocketChatResponseSerializer =
    new _$RocketChatResponseSerializer();

class _$RocketChatResponseSerializer
    implements StructuredSerializer<RocketChatResponse> {
  @override
  final Iterable<Type> types = const [RocketChatResponse, _$RocketChatResponse];
  @override
  final String wireName = 'RocketChatResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, RocketChatResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.msg != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(object.msg,
            specifiedType: const FullType(String)));
    }
    if (object.result != null) {
      result
        ..add('result')
        ..add(serializers.serialize(object.result,
            specifiedType: const FullType(RocketChatResultResponse)));
    }
    return result;
  }

  @override
  RocketChatResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RocketChatResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'result':
          result.result.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RocketChatResultResponse))
              as RocketChatResultResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$RocketChatResponse extends RocketChatResponse {
  @override
  final String msg;
  @override
  final RocketChatResultResponse result;

  factory _$RocketChatResponse(
          [void Function(RocketChatResponseBuilder) updates]) =>
      (new RocketChatResponseBuilder()..update(updates)).build();

  _$RocketChatResponse._({this.msg, this.result}) : super._();

  @override
  RocketChatResponse rebuild(
          void Function(RocketChatResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RocketChatResponseBuilder toBuilder() =>
      new RocketChatResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RocketChatResponse &&
        msg == other.msg &&
        result == other.result;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, msg.hashCode), result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RocketChatResponse')
          ..add('msg', msg)
          ..add('result', result))
        .toString();
  }
}

class RocketChatResponseBuilder
    implements Builder<RocketChatResponse, RocketChatResponseBuilder> {
  _$RocketChatResponse _$v;

  String _msg;
  String get msg => _$this._msg;
  set msg(String msg) => _$this._msg = msg;

  RocketChatResultResponseBuilder _result;
  RocketChatResultResponseBuilder get result =>
      _$this._result ??= new RocketChatResultResponseBuilder();
  set result(RocketChatResultResponseBuilder result) => _$this._result = result;

  RocketChatResponseBuilder();

  RocketChatResponseBuilder get _$this {
    if (_$v != null) {
      _msg = _$v.msg;
      _result = _$v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RocketChatResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RocketChatResponse;
  }

  @override
  void update(void Function(RocketChatResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RocketChatResponse build() {
    _$RocketChatResponse _$result;
    try {
      _$result =
          _$v ?? new _$RocketChatResponse._(msg: msg, result: _result?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RocketChatResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
