import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';

class ConfigSecurity extends StatefulWidget {
  @override
  _ConfigSecurityState createState() => _ConfigSecurityState();
}

class _ConfigSecurityState extends State<ConfigSecurity> {
  @override
  void initState() {
    super.initState();
    _initPopUp();
  }

  Future _initPopUp() async {
    await Future.delayed(Duration(milliseconds: 50));
    showMyDialog(context, NotFound("Sorry", "this feature will soon be available"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Text(
            "Here you'll be able to find your security seettings  which are not yet available "),
      ),
    );
  }
}
