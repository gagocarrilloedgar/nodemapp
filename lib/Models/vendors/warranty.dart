import 'package:json_annotation/json_annotation.dart';
part 'warranty.g.dart';

@JsonSerializable()
class Warranty {
  String uuid;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String userUuid;

  Warranty(this.uuid, this.name,this.createdAt,this.updatedAt,this.deletedAt,this.userUuid);
  factory Warranty.fromJson(Map<String, dynamic> json) =>
      _$WarrantyFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantyToJson(this);
}
