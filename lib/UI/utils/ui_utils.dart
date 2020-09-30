import 'package:flutter/cupertino.dart';
import 'package:nodemappweb/Services/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var devideWith = mediaQuery.size.shortestSide;

  if (devideWith > 950) {
    return DeviceScreenType.Desktop;
  }
  if (devideWith > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
