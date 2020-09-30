import 'package:json_annotation/json_annotation.dart';
part 'motor.g.dart';

@JsonSerializable()
class Motor {
  String uuid;
  String name;
  int price;
  DateTime dateOfProduction;
  String image;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int providerId;
  int stateId;
  String bikeUuid;

  Motor(
      this.uuid,
      this.name,
      this.price,
      this.dateOfProduction,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.providerId,
      this.stateId,
      this.bikeUuid);

  factory Motor.fromJson(Map<String, dynamic> json) => _$MotorFromJson(json);
  Map<String, dynamic> toJson() => _$MotorToJson(this);

  String get partName => name;
  int get partPrice => price;
  String get partDate => dateOfProduction.toString();
  String get partImage => image;
  int get partProviderId => providerId;
  int get partStateId => stateId;
  String get partBikeUUID => bikeUuid;
  void setBikeId(val) => stateId = val;
}
