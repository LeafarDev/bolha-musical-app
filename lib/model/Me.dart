library me;

import 'dart:convert';

import 'package:bolha_musical/model/SpotifyImage.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart' as prefix0;

import 'ExplicitContent.dart';
import 'ExternalUrls.dart';
import 'Followers.dart';

part 'Me.g.dart';

abstract class Me implements Built<Me, MeBuilder> {
  Me._();

  factory Me([updates(MeBuilder b)]) = _$Me;

  @nullable
  @BuiltValueField(wireName: 'email')
  String get email;

  @nullable
  @BuiltValueField(wireName: 'rocket_chat_auth_token')
  String get rocket_chat_auth_token;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: 'external_urls')
  ExternalUrls get externalUrls;

  @nullable
  @BuiltValueField(wireName: 'images')
  BuiltList<SpotifyImage> get images;

  @nullable
  @BuiltValueField(wireName: 'explicit_content')
  ExplicitContent get explicitContent;

  @nullable
  @BuiltValueField(wireName: 'product')
  String get product;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'uri')
  String get uri;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'followers')
  Followers get followers;

  @nullable
  @BuiltValueField(wireName: 'country')
  String get country;

  @nullable
  @BuiltValueField(wireName: 'href')
  String get href;

  getImage() {
    if (images != null) {
      if (images.length > 0) {
        return images[0].url;
      }
    } return store.state.padraoPerfilFoto;
  }

  toDashUSer() {
    return ChatUser(
        uid: id,
        name: displayName,
        avatar: getImage(),
        containerColor: prefix0.Colors.grey,
        color: prefix0.Colors.white);
  }

  static Me fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Me me = standardSerializers.deserializeWith(Me.serializer, parsed);
    return me;
  }

  String toJson() {
    return json.encode(standardSerializers.serializeWith(Me.serializer, this));
  }

  static Serializer<Me> get serializer => _$meSerializer;
}
