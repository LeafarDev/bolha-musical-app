// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Token> _$tokenSerializer = new _$TokenSerializer();

class _$TokenSerializer implements StructuredSerializer<Token> {
  @override
  final Iterable<Type> types = const [Token, _$Token];
  @override
  final String wireName = 'Token';

  @override
  Iterable<Object> serialize(Serializers serializers, Token object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Token deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Token extends Token {
  @override
  final String token;

  factory _$Token([void Function(TokenBuilder) updates]) =>
      (new TokenBuilder()..update(updates)).build();

  _$Token._({this.token}) : super._();

  @override
  Token rebuild(void Function(TokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenBuilder toBuilder() => new TokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Token && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Token')..add('token', token))
        .toString();
  }
}

class TokenBuilder implements Builder<Token, TokenBuilder> {
  _$Token _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  TokenBuilder();

  TokenBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Token other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Token;
  }

  @override
  void update(void Function(TokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Token build() {
    final _$result = _$v ?? new _$Token._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
