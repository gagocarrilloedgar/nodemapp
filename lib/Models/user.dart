//import 'package:nodemappweb/Models/bikes.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nodemappweb/Models/records.dart';

import 'bikes.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String uuid;
  String name;
  String password;
  String last_name;
  String user_name;
  String email;
  String id_doc;
  String phone;
  String updatedAt;
  String createdAt;
  bool is_verfied;
  String deletedAt;

  List<Bikes> bikes;
  List<RecordsView> records;
  //List<Bikes> bikes;

  User(
    this.uuid,
    this.name,
    this.password,
    this.last_name,
    this.user_name,
    this.email,
    this.id_doc,
    this.phone,
    this.is_verfied,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.bikes,
    this.records
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  // to generate the user.g.dart --> flutter packages pub run build_runner build

  //Methods
  List<Bikes> get getBikes => bikes;
  List<RecordsView> get getRecords => records;

  String get getName => name;
  String get getpassword => password;
  String get getuserLastName => last_name;
  String get getUserName => user_name;
  String get getEmail => email;
  String get getIdDoc => id_doc;
  String get getPhone => phone;

}
