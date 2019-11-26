library external_urls;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ExternalUrls.g.dart';

abstract class ExternalUrls
    implements Built<ExternalUrls, ExternalUrlsBuilder> {
  ExternalUrls._();

  factory ExternalUrls([updates(ExternalUrlsBuilder b)]) = _$ExternalUrls;

  @nullable
  @BuiltValueField(wireName: 'spotify')
  String get spotify;

  static Serializer<ExternalUrls> get serializer => _$externalUrlsSerializer;
}