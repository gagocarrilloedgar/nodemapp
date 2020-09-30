import 'package:json_annotation/json_annotation.dart';
part 'records.g.dart';

@JsonSerializable()
class RecordsView{

  int id;
  String description;
  String part;
  String types;
  String date;
  String bikeUuid; 
  String userUuid;

 
  RecordsView(this.id, this.description,this.part,this.types,this.date,this.bikeUuid,this.userUuid);

  factory RecordsView.fromJson(Map<String, dynamic> json) => _$RecordsViewFromJson(json);
  Map<String, dynamic> toJson() => _$RecordsViewToJson(this);

  String get getType => types;
}