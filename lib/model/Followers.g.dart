// GENERATED CODE - DO NOT MODIFY BY HAND

part of followers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Followers> _$followersSerializer = new _$FollowersSerializer();

class _$FollowersSerializer implements StructuredSerializer<Followers> {
  @override
  final Iterable<Type> types = const [Followers, _$Followers];
  @override
  final String wireName = 'Followers';

  @override
  Iterable<Object> serialize(Serializers serializers, Followers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.href != null) {
      result
        ..add('href')
        ..add(serializers.serialize(object.href,
            specifiedType: const FullType(String)));
    }
    if (object.total != null) {
      result
        ..add('total')
        ..add(serializers.serialize(object.total,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Followers deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FollowersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Followers extends Followers {
  @override
  final String href;
  @override
  final int total;

  factory _$Followers([void Function(FollowersBuilder) updates]) =>
      (new FollowersBuilder()..update(updates)).build();

  _$Followers._({this.href, this.total}) : super._();

  @override
  Followers rebuild(void Function(FollowersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowersBuilder toBuilder() => new FollowersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Followers && href == other.href && total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, href.hashCode), total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Followers')
          ..add('href', href)
          ..add('total', total))
        .toString();
  }
}

class FollowersBuilder implements Builder<Followers, FollowersBuilder> {
  _$Followers _$v;

  String _href;
  String get href => _$this._href;
  set href(String href) => _$this._href = href;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  FollowersBuilder();

  FollowersBuilder get _$this {
    if (_$v != null) {
      _href = _$v.href;
      _total = _$v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Followers other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Followers;
  }

  @override
  void update(void Function(FollowersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Followers build() {
    final _$result = _$v ?? new _$Followers._(href: href, total: total);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
