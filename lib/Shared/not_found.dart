import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Shared/themes.dart';

class NotFound extends StatelessWidget {
  final String text;
  final String title;
  const NotFound(this.title,this.text);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: dialogShape,
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: titleFontBlack,
          ),
          SizedBox(
            width: 120,
          ),
          Icon(LineAwesomeIcons.exclamation_circle),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              text,
              style: builtinAppText,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Thanks',
            style: builtinIndigoFont,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
