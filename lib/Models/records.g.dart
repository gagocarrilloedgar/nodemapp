// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordsView _$RecordsViewFromJson(Map<String, dynamic> json) {
  return RecordsView(
    json['id'] as int,
    json['description'] as String,
    json['part'] as String,
    json['types'] as String,
    json['date'] as String,
    json['bikeUuid'] as String,
    json['userUuid'] as String,
  );
}

Map<String, dynamic> _$RecordsViewToJson(RecordsView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'part': instance.part,
      'types': instance.types,
      'date': instance.date,
      'bikeUuid': instance.bikeUuid,
      'userUuid': instance.userUuid,
    };
