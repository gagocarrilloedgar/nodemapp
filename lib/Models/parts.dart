import 'package:json_annotation/json_annotation.dart';
import 'package:nodemappweb/Models/Parts/battery.dart';
import 'package:nodemappweb/Models/Parts/fork.dart';
import 'package:nodemappweb/Models/Parts/frame.dart';
import 'package:nodemappweb/Models/Parts/fwheel.dart';
import 'package:nodemappweb/Models/Parts/motor.dart';
import 'package:nodemappweb/Models/Parts/rwheel.dart';
part 'parts.g.dart';

@JsonSerializable()
class Parts {
  String uuid;
  Frame frameUUID;
  Fork forkUUID;
  Battery batteryUUID;
  Fwheel fwheelUUID;
  Rwheel rwheelUUID;
  Motor motor;

  Parts(this.uuid, this.frameUUID, this.forkUUID,this.batteryUUID,this.fwheelUUID,this.motor,this.rwheelUUID);
  
    factory Parts.fromJson(Map<String, dynamic> json) => _$PartsFromJson(json);
  Map<String, dynamic> toJson() => _$PartsToJson(this);
}

