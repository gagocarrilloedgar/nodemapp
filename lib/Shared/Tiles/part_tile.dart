import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Shared/themes.dart';

class PartTile extends StatelessWidget {
  final String title;
  final String substitle;
  PartTile(this.title, this.substitle);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: builtinIndigoFontBig,
      ),
      subtitle: Text(substitle, style: builtinIndigoFont),
      trailing: Icon(LineAwesomeIcons.credit_card),
    );
  }
}
