import 'package:flutter/material.dart';
import 'package:nodemappweb/Shared/themes.dart';

class RecordTile extends StatelessWidget {
  final String title;
  final String substitle;
  RecordTile(this.title, this.substitle);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: builtinIndigoFontBig,
        ),
        subtitle: Text(substitle, style: builtinIndigoFont),
      ),
    );
  }
}
