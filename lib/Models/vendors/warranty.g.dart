// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warranty _$WarrantyFromJson(Map<String, dynamic> json) {
  return Warranty(
    json['uuid'] as String,
    json['name'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
    json['deletedAt'] as String,
    json['userUuid'] as String,
  );
}

Map<String, dynamic> _$WarrantyToJson(Warranty instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'userUuid': instance.userUuid,
    };
