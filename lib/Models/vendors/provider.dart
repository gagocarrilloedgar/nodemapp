import 'package:json_annotation/json_annotation.dart';
part 'provider.g.dart';

@JsonSerializable()
class Provider {

  int id;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Provider(this.id,this.name,this.createdAt, this.updatedAt,this.deletedAt);
  factory Provider.fromJson(Map<String, dynamic> json) => _$ProviderFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderToJson(this);

  String get getName => name;
}