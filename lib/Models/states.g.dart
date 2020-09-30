// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

States _$StatesFromJson(Map<String, dynamic> json) {
  return States(
    json['id'] as int,
    json['name'] as String,
    json['updatedAt'] as String,
    json['createdAt'] as String,
  );
}

Map<String, dynamic> _$StatesToJson(States instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
