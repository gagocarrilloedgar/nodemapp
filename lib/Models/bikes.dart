import 'package:nodemappweb/Models/Parts/battery.dart';
import 'package:nodemappweb/Models/Parts/fork.dart';
import 'package:nodemappweb/Models/Parts/frame.dart';
import 'package:nodemappweb/Models/Parts/fwheel.dart';
import 'package:nodemappweb/Models/Parts/motor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nodemappweb/Models/Parts/rwheel.dart';
import 'package:nodemappweb/Models/records.dart';
import 'package:nodemappweb/Models/vendors/warranty.dart';
part 'bikes.g.dart';

@JsonSerializable()
class Bikes {
  String uuid;
  String frameid;
  String name;
  String image;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int stateId;
  int modelId;
  String userUuid;
  Warranty warranty;
  Frame frame;
  Fork fork;
  Battery battery;
  Motor motor;
  Rwheel rwheel;
  Fwheel fwheel;

  List<RecordsView> records;

  Bikes(
      this.uuid,
      this.frameid,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.stateId,
      this.modelId,
      this.userUuid,
      this.warranty,
      this.frame,
      this.fork,
      this.battery,
      this.motor,
      this.rwheel,
      this.fwheel,
      this.records);

  factory Bikes.fromJson(Map<String, dynamic> json) => _$BikesFromJson(json);
  Map<String, dynamic> toJson() => _$BikesToJson(this);

  String get bikeUUID => uuid;
  String get bikeFrameId => frameid;
  String get bikeName => name;
  String get bikeImage => image;
  String get bikeCreatedAt => createdAt;
  String get bikeUpdatedAt => updatedAt;

  String get bikeDeletedAt => deletedAt;
  
  int get bikeStateId => stateId;
  void setBikeId(val) => stateId = val;

  int get bikeModelID => modelId;
  String get bikeUserUUID => userUuid;
  Warranty get bikeWarranty => warranty;
  Frame get bikeFrame => frame;
  Fork get bikeFork => fork;
  Battery get bikeBattery => battery;
  Motor get bikeMotor => motor;
  Rwheel get bikeFWheel => rwheel;
  Fwheel get bikeRWheel => fwheel;
  List<RecordsView> get bikeRecords => records;
}
