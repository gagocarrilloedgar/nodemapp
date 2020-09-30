// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fork _$ForkFromJson(Map<String, dynamic> json) {
  return Fork(
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

Map<String, dynamic> _$ForkToJson(Fork instance) => <String, dynamic>{
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
