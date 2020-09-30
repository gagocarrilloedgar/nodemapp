import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/enums/device_screen_type.dart';

class SizingInformation{

  final DeviceScreenType deciveScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deciveScreenType,
    this.localWidgetSize,
    this.screenSize,
  });

  @override
  String toString(){
    return 'DeviceType:$deciveScreenType screenSize:$screenSize, LocalWidgetSize:$localWidgetSize';
  }

}