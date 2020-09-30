// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bikes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bikes _$BikesFromJson(Map<String, dynamic> json) {
  return Bikes(
    json['uuid'] as String,
    json['frameid'] as String,
    json['name'] as String,
    json['image'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
    json['deletedAt'] as String,
    json['stateId'] as int,
    json['modelId'] as int,
    json['userUuid'] as String,
    json['warranty'] == null
        ? null
        : Warranty.fromJson(json['warranty'] as Map<String, dynamic>),
    json['frame'] == null
        ? null
        : Frame.fromJson(json['frame'] as Map<String, dynamic>),
    json['fork'] == null
        ? null
        : Fork.fromJson(json['fork'] as Map<String, dynamic>),
    json['battery'] == null
        ? null
        : Battery.fromJson(json['battery'] as Map<String, dynamic>),
    json['motor'] == null
        ? null
        : Motor.fromJson(json['motor'] as Map<String, dynamic>),
    json['rwheel'] == null
        ? null
        : Rwheel.fromJson(json['rwheel'] as Map<String, dynamic>),
    json['fwheel'] == null
        ? null
        : Fwheel.fromJson(json['fwheel'] as Map<String, dynamic>),
    (json['records'] as List)
        ?.map((e) =>
            e == null ? null : RecordsView.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BikesToJson(Bikes instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'frameid': instance.frameid,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'stateId': instance.stateId,
      'modelId': instance.modelId,
      'userUuid': instance.userUuid,
      'warranty': instance.warranty,
      'frame': instance.frame,
      'fork': instance.fork,
      'battery': instance.battery,
      'motor': instance.motor,
      'rwheel': instance.rwheel,
      'fwheel': instance.fwheel,
      'records': instance.records,
    };
