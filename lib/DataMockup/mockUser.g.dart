// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mockUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mockupuser _$MockupuserFromJson(Map<String, dynamic> json) {
  return Mockupuser(
    json['id'] as String,
    json['name'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$MockupuserToJson(Mockupuser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
    };
