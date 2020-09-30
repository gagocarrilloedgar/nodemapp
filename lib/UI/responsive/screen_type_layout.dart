import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/enums/device_screen_type.dart';
import 'package:nodemappweb/UI/responsive/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget dekstop;
  
  const ScreenTypeLayout({Key key, this.dekstop, this.mobile, this.tablet}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuiler(
      builder: (context, sizingInformation){
        if( sizingInformation.deciveScreenType == DeviceScreenType.Tablet){
          if(tablet != null){
            return tablet;
          }
        }
        if( sizingInformation.deciveScreenType == DeviceScreenType.Desktop){
          if(dekstop != null){
            return  dekstop;
          }
        }

        return mobile;
      }
    );
  }
}