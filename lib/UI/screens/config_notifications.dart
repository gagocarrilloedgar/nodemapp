import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';

class ConfigNotifications extends StatefulWidget {
  @override
  _ConfigNotificationsState createState() => _ConfigNotificationsState();
}

class _ConfigNotificationsState extends State<ConfigNotifications> {
  @override
  void initState() {
    super.initState();
    _initPopUp();
  }

  Future _initPopUp() async {
    await Future.delayed(Duration(milliseconds: 50));
    showMyDialog(
        context, NotFound("Sorry", "this feature will soon be available"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Here you'll be able to modify your notifications settings"),
          Text("This section will soon be available"),
        ],
      ),
    );
  }
}
