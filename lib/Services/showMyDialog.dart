import 'package:flutter/material.dart';


Future<void> showMyDialog(BuildContext context,Widget widget) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return widget;
    },
  );
}
