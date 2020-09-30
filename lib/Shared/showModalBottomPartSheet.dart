import 'package:flutter/material.dart';
import 'package:nodemappweb/UI/screens/partRecords.dart';

void settingModalBottomPartSheet(context) {
  double height = MediaQuery.of(context).size.height * 0.75;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
            height: height,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: PartRecords(height, "uuid"));
      });
}
