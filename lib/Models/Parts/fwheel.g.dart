// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fwheel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fwheel _$FwheelFromJson(Map<String, dynamic> json) {
  return Fwheel(
    json['uuid'] as String,
    json['name'] as String,
    json['price'] as int,
    json['dateOfProduction'] == null
        ? null
        : DateTime.parse(json['dateOfProduction'] as String),
    json['image'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
    json['deletedAt'] as String,
    json['providerId'] as int,
    json['stateId'] as int,
    json['bikeUuid'] as String,
  );
}

Map<String, dynamic> _$FwheelToJson(Fwheel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'price': instance.price,
      'dateOfProduction': instance.dateOfProduction?.toIso8601String(),
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'providerId': instance.providerId,
      'stateId': instance.stateId,
      'bikeUuid': instance.bikeUuid,
    };
