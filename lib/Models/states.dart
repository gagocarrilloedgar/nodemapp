
import 'package:json_annotation/json_annotation.dart';
part 'states.g.dart';

@JsonSerializable()
class States {
  int id;
  String name;
  String updatedAt;
  String createdAt;

  States(this.id,this.name,this.updatedAt,this.createdAt);

  factory States.fromJson(Map<String, dynamic> json) => _$StatesFromJson(json);
  Map<String, dynamic> toJson() => _$StatesToJson(this);
  
}