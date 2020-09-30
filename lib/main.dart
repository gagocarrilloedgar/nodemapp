//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/Providers/config_navigation_provider.dart';
import 'package:nodemappweb/UI/utils/routes.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:nodemappweb/ViewModels/bikepartsViewModel.dart';
import 'package:nodemappweb/ViewModels/brandViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ConfigNavigationProvider()),
          ChangeNotifierProvider(create: (context) => UserViewModel()),
          ChangeNotifierProvider(create: (context) => BrandViewModel()),
          ChangeNotifierProvider(create: (context) => BikeViewModel()),
           ChangeNotifierProvider(create: (context) => BikePartViewModel()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
