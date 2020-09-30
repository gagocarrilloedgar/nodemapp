// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Models _$ModelsFromJson(Map<String, dynamic> json) {
  return Models(
    json['id'] as int,
    json['createdAt'] as String,
    json['updatedAt'] as String,
    json['deletedAt'] as String,
    json['name'] as String,
    json['brandId'] as int,
  );
}

Map<String, dynamic> _$ModelsToJson(Models instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'brandId': instance.brandId,
    };
