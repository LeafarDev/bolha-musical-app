library device;

import 'dart:convert';

import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' as prefix0;

part 'Device.g.dart';

abstract class Device implements Built<Device, DeviceBuilder> {
  Device._();


  factory Device([updates(DeviceBuilder b)]) = _$Device;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'is_active')
  bool get isActive;

  @nullable
  @BuiltValueField(wireName: 'is_private_session')
  bool get isPrivateSession;

  @nullable
  @BuiltValueField(wireName: 'is_restricted')
  bool get isRestricted;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: 'volume_percent')
  int get volumePercent;

  static Device fromJson(String jsonString) {
    final parsed = jsonDecode(jsonString);
    Device device =
        standardSerializers.deserializeWith(Device.serializer, parsed);
    return device;
  }

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Device.serializer, this));
  }

  static Serializer<Device> get serializer => _$deviceSerializer;

  prefix0.IconData getIcon() {
    var lista = {
      'Computer': prefix0.Icons.computer,
      'Tablet': prefix0.Icons.tablet,
      'Smartphone': prefix0.Icons.smartphone,
      'Speaker': prefix0.Icons.speaker,
      'TV': prefix0.Icons.tv,
      'AVR': prefix0.Icons.speaker,
      'STB': prefix0.Icons.speaker,
      'AudioDongle': prefix0.Icons.speaker,
      'GameConsole': prefix0.Icons.videogame_asset,
      'CastVideo': prefix0.Icons.cast,
      'CastAudio': prefix0.Icons.cast,
      'Automobile': prefix0.Icons.directions_car,
      'Unknown': prefix0.Icons.device_unknown
    };
    if (type != null) {
      return lista[type];
    }
    return prefix0.Icons.device_unknown;
  }
}
