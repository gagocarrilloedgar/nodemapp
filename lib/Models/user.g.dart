// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['uuid'] as String,
    json['name'] as String,
    json['password'] as String,
    json['last_name'] as String,
    json['user_name'] as String,
    json['email'] as String,
    json['id_doc'] as String,
    json['phone'] as String,
    json['is_verfied'] as bool,
    json['createdAt'] as String,
    json['updatedAt'] as String,
    json['deletedAt'] as String,
    (json['bikes'] as List)
        ?.map(
            (e) => e == null ? null : Bikes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['records'] as List)
        ?.map((e) =>
            e == null ? null : RecordsView.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'password': instance.password,
      'last_name': instance.last_name,
      'user_name': instance.user_name,
      'email': instance.email,
      'id_doc': instance.id_doc,
      'phone': instance.phone,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'is_verfied': instance.is_verfied,
      'deletedAt': instance.deletedAt,
      'bikes': instance.bikes,
      'records': instance.records,
    };
