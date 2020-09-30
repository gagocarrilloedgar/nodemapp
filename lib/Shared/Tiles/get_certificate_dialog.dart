import 'package:flutter/material.dart';
import 'package:nodemappweb/Shared/themes.dart';

class GetCertificateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("This feature is not available yet. It will be soon available, stay tunned!"),
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
