// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:bolha_musical/model/Album.dart';
import 'package:bolha_musical/model/Artist.dart';
import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/model/ExplicitContent.dart';
import 'package:bolha_musical/model/ExternalUrls.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/model/Message.dart';
import 'package:bolha_musical/model/RocketChatResultResponse.dart';
import 'package:bolha_musical/model/SearchTrackResult.dart';
import 'package:bolha_musical/model/SpotifyImage.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/model/Ts.dart';
import 'package:bolha_musical/model/U.dart';
import 'package:bolha_musical/model/UpdatedAt.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'AuthState.dart';
import 'Bolha.dart';
import 'ExternalIds.dart';
import 'Followers.dart';
import 'Me.dart';
import 'RocketChatResponse.dart';
import 'RocketChatResultResponse.dart';
import 'Token.dart';
import 'User.dart';
import 'Voto.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor([
  AuthState,
  Me,
  Followers,
  ExplicitContent,
  ExternalUrls,
  Token,
  SpotifyImage,
  AppState,
  Localizacao,
  Bolha,
  BolhaMembro,
  User,
  BackendMessage,
  SearchTrackResult,
  ExternalIds,
  Album,
  Message,
  Track,
  Artist,
  Device,
  RocketChatResponse,
  RocketChatResultResponse,
  Ts,
  U,
  Voto,
  UpdatedAt
])
Serializers serializers = _$serializers;
Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
