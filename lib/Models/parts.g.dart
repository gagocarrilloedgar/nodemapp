// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parts _$PartsFromJson(Map<String, dynamic> json) {
  return Parts(
    json['uuid'] as String,
    json['frameUUID'] == null
        ? null
        : Frame.fromJson(json['frameUUID'] as Map<String, dynamic>),
    json['forkUUID'] == null
        ? null
        : Fork.fromJson(json['forkUUID'] as Map<String, dynamic>),
    json['batteryUUID'] == null
        ? null
        : Battery.fromJson(json['batteryUUID'] as Map<String, dynamic>),
    json['fwheelUUID'] == null
        ? null
        : Fwheel.fromJson(json['fwheelUUID'] as Map<String, dynamic>),
    json['motor'] == null
        ? null
        : Motor.fromJson(json['motor'] as Map<String, dynamic>),
    json['rwheelUUID'] == null
        ? null
        : Rwheel.fromJson(json['rwheelUUID'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PartsToJson(Parts instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'frameUUID': instance.frameUUID,
      'forkUUID': instance.forkUUID,
      'batteryUUID': instance.batteryUUID,
      'fwheelUUID': instance.fwheelUUID,
      'rwheelUUID': instance.rwheelUUID,
      'motor': instance.motor,
    };
