

import 'package:json_annotation/json_annotation.dart';
part 'mockUser.g.dart';

@JsonSerializable(explicitToJson: true)
class Mockupuser {
  String id;
  String name;
  String password;

  Mockupuser(this.id,this.name, this.password);


  factory Mockupuser.fromJson(Map<String, dynamic> json) => _$MockupuserFromJson(json);
  Map<String, dynamic> toJson() => _$MockupuserToJson(this);
  // to generate the user.g.dart --> flutter packages pub run build_runner build
}