import 'package:flutter/material.dart';
import 'package:nodemappweb/UI/responsive/sizing_information.dart';
import 'package:nodemappweb/UI/utils/ui_utils.dart';

class ResponsiveBuiler extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuiler({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraints) {
      var sizingInformation = SizingInformation(
        deciveScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.minHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
