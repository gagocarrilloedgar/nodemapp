import 'package:flutter/material.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';
import 'package:getflutter/types/gf_button_type.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Services/Providers/config_navigation_provider.dart';

import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:provider/provider.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';

import 'bodywrapper.dart';

class ViewData extends StatefulWidget {
  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  //int _selectedIndex = 0;
  String _selectedIndexTitle = "Settings";
  //final _formKey = GlobalKey<FormState>(); // form validation key

  @override
  Widget build(BuildContext context) {
    ConfigNavigationProvider _navifationProvider =
        Provider.of<ConfigNavigationProvider>(context);

    Future _onItemTapped(int index) async {
      _navifationProvider.setCurrentIndex(index);
      print("Change to index: " + index.toString());
    }

    void saveData() {
    if (_navifationProvider.bikeFormKey.currentState.validate()) {
      showMyDialog(
          context, NotFound("Nice", "Your data has been correctly updated"));
    }
}

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GFAppBar(
          backgroundColor: Colors.white,
          leading: GFIconButton(
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: Colors.indigo[900],
              size: 22,
            ),
            onPressed: () => Navigator.of(context).pop(false),
            type: GFButtonType.transparent,
          ),
          searchHintStyle: builtinIndigoFont,
          searchTextStyle: builtinIndigoFont,
          searchBar: false,
          searchBarColorTheme: Colors.indigo[900],
          title: titleConfigText(_selectedIndexTitle),
          actions: <Widget>[
            GFIconButton(
              icon: Icon(
                Icons.check,
                color: Colors.indigo[900],
                size: 25,
              ),
              onPressed: () => saveData(),
              type: GFButtonType.transparent,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Form(child: BodyWrapper(_navifationProvider.getCurrenIndex)),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _navifationProvider.getCurrenIndex,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.indigo[900],
            unselectedItemColor: Colors.indigo[200],
            selectedIconTheme: IconThemeData(size: 25),
            unselectedIconTheme: IconThemeData(size: 20),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            elevation: 0,
            items: <BottomNavigationBarItem>[
              bottomNavigationBarItem(LineAwesomeIcons.user, "Main"),
              bottomNavigationBarItem(LineAwesomeIcons.bicycle, "Bike"),
              //bottomNavigationBarItem(LineAwesomeIcons.gears, "Bike part"),
              bottomNavigationBarItem(LineAwesomeIcons.shield, "Security"),
              bottomNavigationBarItem(LineAwesomeIcons.bell, "Notifications"),
            ]),
      ),
    );
  }
}
