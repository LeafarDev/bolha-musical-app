// GENERATED CODE - DO NOT MODIFY BY HAND

part of me;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Me> _$meSerializer = new _$MeSerializer();

class _$MeSerializer implements StructuredSerializer<Me> {
  @override
  final Iterable<Type> types = const [Me, _$Me];
  @override
  final String wireName = 'Me';

  @override
  Iterable<Object> serialize(Serializers serializers, Me object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.externalUrls != null) {
      result
        ..add('external_urls')
        ..add(serializers.serialize(object.externalUrls,
            specifiedType: const FullType(ExternalUrls)));
    }
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType:
                const FullType(BuiltList, const [const FullType(UserImage)])));
    }
    if (object.explicitContent != null) {
      result
        ..add('explicit_content')
        ..add(serializers.serialize(object.explicitContent,
            specifiedType: const FullType(ExplicitContent)));
    }
    if (object.product != null) {
      result
        ..add('product')
        ..add(serializers.serialize(object.product,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.uri != null) {
      result
        ..add('uri')
        ..add(serializers.serialize(object.uri,
            specifiedType: const FullType(String)));
    }
    if (object.displayName != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(object.displayName,
            specifiedType: const FullType(String)));
    }
    if (object.followers != null) {
      result
        ..add('followers')
        ..add(serializers.serialize(object.followers,
            specifiedType: const FullType(Followers)));
    }
    if (object.country != null) {
      result
        ..add('country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.href != null) {
      result
        ..add('href')
        ..add(serializers.serialize(object.href,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Me deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'external_urls':
          result.externalUrls.replace(serializers.deserialize(value,
              specifiedType: const FullType(ExternalUrls)) as ExternalUrls);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserImage)]))
              as BuiltList<dynamic>);
          break;
        case 'explicit_content':
          result.explicitContent.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ExplicitContent))
              as ExplicitContent);
          break;
        case 'product':
          result.product = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(Followers)) as Followers);
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Me extends Me {
  @override
  final String email;
  @override
  final String type;
  @override
  final ExternalUrls externalUrls;
  @override
  final BuiltList<UserImage> images;
  @override
  final ExplicitContent explicitContent;
  @override
  final String product;
  @override
  final String id;
  @override
  final String uri;
  @override
  final String displayName;
  @override
  final Followers followers;
  @override
  final String country;
  @override
  final String href;

  factory _$Me([void Function(MeBuilder) updates]) =>
      (new MeBuilder()..update(updates)).build();

  _$Me._(
      {this.email,
      this.type,
      this.externalUrls,
      this.images,
      this.explicitContent,
      this.product,
      this.id,
      this.uri,
      this.displayName,
      this.followers,
      this.country,
      this.href})
      : super._();

  @override
  Me rebuild(void Function(MeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeBuilder toBuilder() => new MeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Me &&
        email == other.email &&
        type == other.type &&
        externalUrls == other.externalUrls &&
        images == other.images &&
        explicitContent == other.explicitContent &&
        product == other.product &&
        id == other.id &&
        uri == other.uri &&
        displayName == other.displayName &&
        followers == other.followers &&
        country == other.country &&
        href == other.href;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, email.hashCode),
                                                type.hashCode),
                                            externalUrls.hashCode),
                                        images.hashCode),
                                    explicitContent.hashCode),
                                product.hashCode),
                            id.hashCode),
                        uri.hashCode),
                    displayName.hashCode),
                followers.hashCode),
            country.hashCode),
        href.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Me')
          ..add('email', email)
          ..add('type', type)
          ..add('externalUrls', externalUrls)
          ..add('images', images)
          ..add('explicitContent', explicitContent)
          ..add('product', product)
          ..add('id', id)
          ..add('uri', uri)
          ..add('displayName', displayName)
          ..add('followers', followers)
          ..add('country', country)
          ..add('href', href))
        .toString();
  }
}

class MeBuilder implements Builder<Me, MeBuilder> {
  _$Me _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  ExternalUrlsBuilder _externalUrls;
  ExternalUrlsBuilder get externalUrls =>
      _$this._externalUrls ??= new ExternalUrlsBuilder();
  set externalUrls(ExternalUrlsBuilder externalUrls) =>
      _$this._externalUrls = externalUrls;

  ListBuilder<UserImage> _images;
  ListBuilder<UserImage> get images =>
      _$this._images ??= new ListBuilder<UserImage>();
  set images(ListBuilder<UserImage> images) => _$this._images = images;

  ExplicitContentBuilder _explicitContent;
  ExplicitContentBuilder get explicitContent =>
      _$this._explicitContent ??= new ExplicitContentBuilder();
  set explicitContent(ExplicitContentBuilder explicitContent) =>
      _$this._explicitContent = explicitContent;

  String _product;
  String get product => _$this._product;
  set product(String product) => _$this._product = product;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _uri;
  String get uri => _$this._uri;
  set uri(String uri) => _$this._uri = uri;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  FollowersBuilder _followers;
  FollowersBuilder get followers =>
      _$this._followers ??= new FollowersBuilder();
  set followers(FollowersBuilder followers) => _$this._followers = followers;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _href;
  String get href => _$this._href;
  set href(String href) => _$this._href = href;

  MeBuilder();

  MeBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _type = _$v.type;
      _externalUrls = _$v.externalUrls?.toBuilder();
      _images = _$v.images?.toBuilder();
      _explicitContent = _$v.explicitContent?.toBuilder();
      _product = _$v.product;
      _id = _$v.id;
      _uri = _$v.uri;
      _displayName = _$v.displayName;
      _followers = _$v.followers?.toBuilder();
      _country = _$v.country;
      _href = _$v.href;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Me other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Me;
  }

  @override
  void update(void Function(MeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Me build() {
    _$Me _$result;
    try {
      _$result = _$v ??
          new _$Me._(
              email: email,
              type: type,
              externalUrls: _externalUrls?.build(),
              images: _images?.build(),
              explicitContent: _explicitContent?.build(),
              product: product,
              id: id,
              uri: uri,
              displayName: displayName,
              followers: _followers?.build(),
              country: country,
              href: href);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'externalUrls';
        _externalUrls?.build();
        _$failedField = 'images';
        _images?.build();
        _$failedField = 'explicitContent';
        _explicitContent?.build();

        _$failedField = 'followers';
        _followers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('Me', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
