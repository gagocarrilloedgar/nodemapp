import 'package:flutter/material.dart';
import 'package:nodemappweb/UI/screens/config_bike.dart';
import 'package:nodemappweb/UI/screens/config_security.dart';
import 'package:nodemappweb/UI/screens/main_settings.dart';

import 'config_notifications.dart';

class BodyWrapper extends StatelessWidget {
  final int selection;
  BodyWrapper(this.selection);
  @override
  Widget build(BuildContext context) {
    switch (selection) {
      case 0:
        return MainSetttingsScreen();
        break;
      case 1:
        return ConfigBike();
        break;
      /*case 2:
        return ConfigParts();
        break;*/
      case 2:
        return ConfigSecurity();
        break;
      case 3:
        return ConfigNotifications();
        break;
      default:
        return MainSetttingsScreen();
        break;
    }
  }
}
