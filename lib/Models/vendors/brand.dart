import 'package:json_annotation/json_annotation.dart';
import 'package:nodemappweb/Models/vendors/models.dart';
part'brand.g.dart';

@JsonSerializable()
class Brand {

  int id;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;
  List<Models> models ;

  Brand(this.id,this.name, this.updatedAt,this.createdAt,this.deletedAt, this.models);
  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}


