import 'package:flutter/material.dart';
import 'package:nodemappweb/UI/home/init.dart';
import 'package:nodemappweb/UI/home/login.dart';
import 'package:nodemappweb/UI/home/mainUI.dart';
import 'package:nodemappweb/UI/home/sigin.dart';

final routes = {
  '/login': (BuildContext context) => new Login(),
  '/singin': (BuildContext context) => new SignIn(),
  '/home': (BuildContext context) => new MainUI(),
  '/': (BuildContext context) => new InitialScreen(),
};