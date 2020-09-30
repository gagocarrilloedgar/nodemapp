import 'package:json_annotation/json_annotation.dart';
part'models.g.dart';

@JsonSerializable()
class Models {

  int id;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int brandId;

  Models(this.id,this.createdAt, this.updatedAt,this.deletedAt,this.name,this.brandId);
  factory Models.fromJson(Map<String, dynamic> json) => _$ModelsFromJson(json);
  Map<String, dynamic> toJson() => _$ModelsToJson(this);

  String get getName => name;
}