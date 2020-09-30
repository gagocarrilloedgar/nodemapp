import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';

import 'package:getflutter/getflutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Services/Providers/config_navigation_provider.dart';
import 'package:nodemappweb/Services/Providers/qr_provider.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/Tiles/bikeinfodialog.dart';
import 'package:nodemappweb/Shared/colors.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/home/login.dart';
import 'package:nodemappweb/UI/home/qr_home.dart';
import 'package:nodemappweb/UI/screens/addbike.dart';
import 'package:nodemappweb/UI/screens/addpart.dart';
import 'package:nodemappweb/UI/screens/bikes_list_view.dart';
import 'package:nodemappweb/UI/screens/stolen_bikes.dart';
import 'package:nodemappweb/UI/screens/view_data.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class MainUI extends StatefulWidget {
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  int _selectedIndex = 0;
  String nameletters = "ED";
  String _homeTitle = "Home";
  int selection = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: MainUIAppBAR(_homeTitle, _scaffoldKey),
      ),
      key: _scaffoldKey,
      body: _selectedIndex == 3 ? StolenBikesScreen() : BikesGridView(),
      drawer: MainUIDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.indigo[900],
        unselectedItemColor: Colors.indigo[200],
        selectedIconTheme: IconThemeData(size: 22),
        unselectedIconTheme: IconThemeData(size: 20),
        showUnselectedLabels: true,
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          bottomNavigationBarItem(LineAwesomeIcons.home, "Home"),
          bottomNavigationBarItem(LineAwesomeIcons.map, "Find parking"),
          bottomNavigationBarItem(Icons.store, "Marketplace"),
          bottomNavigationBarItem(LineAwesomeIcons.search, "Stolen parts"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: MainUISpeedDial(),
    );
  }

  Future _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainUI()));
      }
      if (_selectedIndex == 1 || _selectedIndex == 2) {
        showMyDialog(
            context, NotFound("Sorry", "This fetaure will soon be available"));
        _selectedIndex = 0;
      }
      if (_selectedIndex == 3) {
        _homeTitle = "Stolen Parts";
      }
    });
  }
}

class MainUISpeedDial extends StatefulWidget {
  @override
  _MainUISpeedDialState createState() => _MainUISpeedDialState();
}

class _MainUISpeedDialState extends State<MainUISpeedDial> {
  String result = " ";

  @override
  Widget build(BuildContext context) {
    BikeViewModel _bikeVM = Provider.of<BikeViewModel>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => QrProvider(),
      child: SpeedDial(
        backgroundColor: Colors.indigo[900],
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(LineAwesomeIcons.plus, color: Colors.white),
            backgroundColor: Colors.indigo[600],
            onTap: () => showMyDialog(context, AddBikeDialog()),
            label: 'Add Bike',
            labelStyle: roundButtonTextStyle,
            labelBackgroundColor: Colors.indigo[600],
          ),
          SpeedDialChild(
            child: Icon(LineAwesomeIcons.sign_out, color: Colors.white),
            backgroundColor: Colors.indigo[400],
            onTap: () => showMyDialog(context,
                NotFound("Sorry", "This feature will soon be available")),
            label: 'Transfer bike',
            labelStyle: roundButtonTextStyle,
            labelBackgroundColor: Colors.indigo[400],
          ),
          SpeedDialChild(
            child: Icon(LineAwesomeIcons.plus, color: Colors.white),
            backgroundColor: lilalogo,
            onTap: () => showMyDialog(context, AddPartDialog()),
            label: 'Add Part',
            labelStyle: roundButtonTextStyle,
            labelBackgroundColor: lilalogo,
          ),
          SpeedDialChild(
            child: Icon(LineAwesomeIcons.sign_out, color: Colors.white),
            backgroundColor: lilaclarologo,
            onTap: () => showMyDialog(context,
                NotFound("Sorry", "This feature will soon be available")),
            label: 'Transfer part',
            labelStyle: roundButtonTextStyle,
            labelBackgroundColor: lilaclarologo,
          ),
          SpeedDialChild(
            child: Icon(LineAwesomeIcons.camera, color: Colors.white),
            backgroundColor: lilaclarologo,
            onTap: () async {
              String qrCode;
              //QrProvider _qrProvider = Provider.of<QrProvider>(context);
              try {
                _bikeVM.setIsLoading(true);
                qrCode = await BarcodeScanner.scan();
                // _qrProvider.setQR(qrCode);
              } catch (e) {
                showMyDialog(
                    context,
                    NotFound("Sorry",
                        "Whe haven't been able to identify the QR")); //we can print on the page that user has cancelled
              }
              showMyDialog(context, BikeInfoDialog());
              var resp = await _bikeVM.getBikeByUUID(qrCode);

              if (resp == true) {
                _bikeVM.setIsLoading(false);
              } else {
                showMyDialog(
                    context,
                    NotFound("Sorry",
                        "We haven't been able to find what you are looking for"));
              }
            },
            label: 'CheckPart',
            labelStyle: roundButtonTextStyle,
            labelBackgroundColor: lilaclarologo,
          ),
        ],
      ),
    );
  }
}

class DrawerCard extends StatelessWidget {
  final IconData _iconData;
  final String _title;
  final String _subtitle;
  final int _index;
  DrawerCard(this._iconData, this._title, this._subtitle, this._index);
  @override
  Widget build(BuildContext context) {
    ConfigNavigationProvider _navigationProvider =
        Provider.of<ConfigNavigationProvider>(context);
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return ListTile(
      onTap: () {
        if (_index == 5) {
          Navigator.of(context).pop(false);
          showMyDialog(
              context,
              NotFound("Wow",
                  "Thanks for the support! We are preparaing some great stuff. Will reach out to you soon!"));
        } else if (_index == 6) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        } else if (_index == 7) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QrHome()));
        } else {
          Navigator.of(context).pop(false);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ViewData()));
          _navigationProvider.setCurrentIndex(_index);
          _userViewModel.setSelectedBikePartIndex(0);
          _userViewModel.selectBike(0);
        }
      },
      leading: Icon(
        _iconData,
        color: Colors.indigo[900],
      ),
      title: Text(
        _title,
        style: builtinIndigoFontBig,
      ),
      subtitle: Text(
        _subtitle,
        style: builtinAppTextSmall,
      ),
    );
  }
}

class MainUIAppBAR extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final String _title;
  MainUIAppBAR(this._title, this._scaffoldKey);
  @override
  Widget build(BuildContext context) {
    UserViewModel _userVM = Provider.of<UserViewModel>(context);
    BikeViewModel _bikeVM = Provider.of<BikeViewModel>(context);
    return GFAppBar(
      onSubmitted: (val) async {
        var resp;
        print(val);
        for (var item in _userVM.user.bikes) {
          if (item.bikeUUID == val) {
            print(val);
            print(item.bikeUUID);
            resp = await _bikeVM.getBikeByUUID(item.bikeUUID);
          }
        }
        if (resp == true) {
          showMyDialog(context, BikeInfoDialog());
        } else {
          showMyDialog(
              context,
              NotFound("Sorry",
                  "We haven't been able to find what you are looking for"));
        }
      },
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: GFIconButton(
          icon: Icon(
            LineAwesomeIcons.reorder,
            color: Colors.indigo[900],
            size: 20,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          type: GFButtonType.transparent,
        ),
      ),
      searchHintStyle: builtinIndigoFont,
      searchTextStyle: builtinIndigoFont,
      searchBar: true,
      searchBarColorTheme: Colors.indigo[900],
      title: titleConfigText(_title),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
          child: GFAvatar(
            backgroundColor: Colors.indigo[900],
            radius: 10,
          ),
        ),
      ],
    );
  }
}

class MainUIDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Center(
            child: GFAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Center(
                  child: Icon(LineAwesomeIcons.user,
                      size: 50, color: Colors.indigo[900])),
              /*backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4D03AQFsaH38C7jnGA/profile-displayphoto-shrink_400_400/0?e=1595462400&v=beta&t=_HG8kLC6gJjt2cLAAn0bhRkdKBrBNq0KIDgIH2sszCI'),*/
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(_userViewModel.user.name, style: subtitleFont),
            SizedBox(
              width: 10,
            ),
            Visibility(
                visible: _userViewModel.user.is_verfied == null
                    ? false
                    : _userViewModel.user.is_verfied,
                child: Icon(
                  Icons.verified_user,
                  color: Colors.amber,
                )),
          ]),
          Text(_userViewModel.user.email, style: subtitleFont),
        ],
      ),
      decoration: linearGradiengBox,
    );
  }
}

class MainUIDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          MainUIDrawerHeader(),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerCard(LineAwesomeIcons.star, "Premium services",
                    "Want to enven get more features?", 5),
                DrawerCard(LineAwesomeIcons.gear, "Main settings",
                    "Update and modify your profile", 0),
                DrawerCard(LineAwesomeIcons.bicycle, "Bikes",
                    "Check and update your bikes", 1),
                /*DrawerCard(Icons.dashboard, "Bike parts",
                    "Check and update your bike parts", 2),*/
                DrawerCard(LineAwesomeIcons.shield, "Privacy",
                    "Modify your security settings", 2),
                DrawerCard(LineAwesomeIcons.bell, "Notifications",
                    "Change your notification settings", 3),
                /*DrawerCard(LineAwesomeIcons.qrcode, "QR",
                    "Share your assets or search other assetss by QR code", 7),*/
                DrawerCard(LineAwesomeIcons.sign_out, "SignOut", " ", 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
