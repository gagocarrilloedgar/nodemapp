import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nodemappweb/Shared/themes.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: linearGradiengBox,
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 50,
      ),
      
    );
  }
}

class LoadingForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      color: Colors.white,
      child: SpinKitFadingCircle(
        color: Colors.indigo[900],
        size: 50,
      ),
      
    );
  }
}