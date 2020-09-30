import 'package:flutter/material.dart';
import 'package:nodemappweb/Shared/themes.dart';

class NotModifiablePropertyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("This property can't be modified"),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Close',
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
