import 'package:flutter/material.dart';
import 'package:nodemappweb/Shared/themes.dart';

class StolenBikeDialog extends StatelessWidget {
  final String _text;
  final String title;
  const StolenBikeDialog(this.title,this._text);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: titleFontBlack,
          ),
          SizedBox(
            width: 90,
          ),
          Icon(Icons.error_outline),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            RichText(
              text: TextSpan(text: _text,style:builtinAppText ),
              textAlign: TextAlign.justify,
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
