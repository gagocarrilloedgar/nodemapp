import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nodemappweb/Shared/colors.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/home/sigin.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
     BikeViewModel _bikesVM  = Provider.of<BikeViewModel>(context);
    var screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: linearGradiengBox,
        child: Stack(alignment: Alignment.topCenter, children: <Widget>[
          Positioned(
            top: 100,
            child: Image(
              width: 120,
              image: AssetImage('assets/images/nodemlogo.png'),
            ),
          ),
          Positioned(
            top: 300,
            child: Text(
              'Reinventing bike ',
              style: titleFont,
            ),
          ),
          Positioned(
            top: 320,
            child: Text(
              'ownserhsip & security',
              style: titleFont,
            ),
          ),
          /*Positioned(
            bottom: 150,
            child: Container(
              width: screenWidht * 3 / 4,
              height: 50,
              child: RaisedButton(
                onPressed: () async {
                  await _bikesVM.getBikesByState();
                },
                shape: roundButtonShape,
                color: turqeusaoscurologo,
                child: Row(
                  children: <Widget>[
                    Text(
                      'TEST',
                      style: roundButtonTextStyle,
                    ),
                    SizedBox(width: screenWidht * 3 / 4 - 100),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),*/
          Positioned(
            bottom: 70,
            child: Container(
              width: screenWidht * 3 / 4,
              height: 50,
              child: RaisedButton(
                onPressed: () => gotoLoginIn(context),
                shape: roundButtonShape,
                color: turqeusaoscurologo,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Login',
                      style: roundButtonTextStyle,
                    ),
                    SizedBox(width: screenWidht * 3 / 4 - 100),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: screenWidht * 3 / 4,
              height: 50,
              child: RaisedButton(
                onPressed: () => gotoSignIn(context),
                shape: roundButtonShape,
                color: lilalogo,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Sigin',
                      style: roundButtonTextStyle,
                    ),
                    SizedBox(width: screenWidht * 3 / 4 - 100),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future gotoSignIn(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  Future gotoLoginIn(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}
