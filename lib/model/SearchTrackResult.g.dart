// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_track_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchTrackResult> _$searchTrackResultSerializer =
    new _$SearchTrackResultSerializer();

class _$SearchTrackResultSerializer
    implements StructuredSerializer<SearchTrackResult> {
  @override
  final Iterable<Type> types = const [SearchTrackResult, _$SearchTrackResult];
  @override
  final String wireName = 'SearchTrackResult';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchTrackResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.href != null) {
      result
        ..add('href')
        ..add(serializers.serialize(object.href,
            specifiedType: const FullType(String)));
    }
    if (object.limit != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(object.limit,
            specifiedType: const FullType(int)));
    }
    if (object.next != null) {
      result
        ..add('next')
        ..add(serializers.serialize(object.next,
            specifiedType: const FullType(String)));
    }
    if (object.offset != null) {
      result
        ..add('offset')
        ..add(serializers.serialize(object.offset,
            specifiedType: const FullType(int)));
    }
    if (object.tracks != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.tracks,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Track)])));
    }
    if (object.previous != null) {
      result
        ..add('previous')
        ..add(serializers.serialize(object.previous,
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
  SearchTrackResult deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchTrackResultBuilder();

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
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.tracks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Track)]))
              as BuiltList<dynamic>);
          break;
        case 'previous':
          result.previous = serializers.deserialize(value,
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

class _$SearchTrackResult extends SearchTrackResult {
  @override
  final String href;
  @override
  final int limit;
  @override
  final String next;
  @override
  final int offset;
  @override
  final BuiltList<Track> tracks;
  @override
  final String previous;
  @override
  final int total;

  factory _$SearchTrackResult(
          [void Function(SearchTrackResultBuilder) updates]) =>
      (new SearchTrackResultBuilder()..update(updates)).build();

  _$SearchTrackResult._(
      {this.href,
      this.limit,
      this.next,
      this.offset,
      this.tracks,
      this.previous,
      this.total})
      : super._();

  @override
  SearchTrackResult rebuild(void Function(SearchTrackResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchTrackResultBuilder toBuilder() =>
      new SearchTrackResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchTrackResult &&
        href == other.href &&
        limit == other.limit &&
        next == other.next &&
        offset == other.offset &&
        tracks == other.tracks &&
        previous == other.previous &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, href.hashCode), limit.hashCode),
                        next.hashCode),
                    offset.hashCode),
                tracks.hashCode),
            previous.hashCode),
        total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchTrackResult')
          ..add('href', href)
          ..add('limit', limit)
          ..add('next', next)
          ..add('offset', offset)
          ..add('tracks', tracks)
          ..add('previous', previous)
          ..add('total', total))
        .toString();
  }
}

class SearchTrackResultBuilder
    implements Builder<SearchTrackResult, SearchTrackResultBuilder> {
  _$SearchTrackResult _$v;

  String _href;

  String get href => _$this._href;

  set href(String href) => _$this._href = href;

  int _limit;

  int get limit => _$this._limit;

  set limit(int limit) => _$this._limit = limit;

  String _next;

  String get next => _$this._next;

  set next(String next) => _$this._next = next;

  int _offset;

  int get offset => _$this._offset;

  set offset(int offset) => _$this._offset = offset;

  ListBuilder<Track> _tracks;

  ListBuilder<Track> get tracks => _$this._tracks ??= new ListBuilder<Track>();

  set tracks(ListBuilder<Track> tracks) => _$this._tracks = tracks;

  String _previous;

  String get previous => _$this._previous;

  set previous(String previous) => _$this._previous = previous;

  int _total;

  int get total => _$this._total;

  set total(int total) => _$this._total = total;

  SearchTrackResultBuilder();

  SearchTrackResultBuilder get _$this {
    if (_$v != null) {
      _href = _$v.href;
      _limit = _$v.limit;
      _next = _$v.next;
      _offset = _$v.offset;
      _tracks = _$v.tracks?.toBuilder();
      _previous = _$v.previous;
      _total = _$v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchTrackResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchTrackResult;
  }

  @override
  void update(void Function(SearchTrackResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchTrackResult build() {
    _$SearchTrackResult _$result;
    try {
      _$result = _$v ??
          new _$SearchTrackResult._(
              href: href,
              limit: limit,
              next: next,
              offset: offset,
              tracks: _tracks?.build(),
              previous: previous,
              total: total);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tracks';
        _tracks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchTrackResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
