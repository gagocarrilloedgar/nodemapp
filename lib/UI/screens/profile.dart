import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/home/mainUI.dart';
import 'package:provider/provider.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 1;
  String email = "edgargc.upc@gmail.com";
  bool isVerified = true;
  @override
  Widget build(BuildContext context) {
    // ################ LENGHTS
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    // Implementation of the provider 
    UserMockViewModel _userViewModel = Provider.of<UserMockViewModel>(context);
        //print(_userViewModel.user.name);
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: screenWidth,
              height: screenHeigth,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: screenWidth,
                      height: screenHeigth * 2 / 7,
                      decoration: linearGradiengBoxUp,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Profile',
                            style: titleFont,
                          ),
                          SizedBox(
                            width: 190,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () => showMyDialog(
                                context,
                                NotFound("Sorry",
                                    "This fetaure will soon be available")),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: 300,
                        height: screenHeigth / 3 - 20,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: Icon(
                                    LineAwesomeIcons.arrow_left,
                                    size: 25,
                                    color: Colors.indigo,
                                  ),
                                  onPressed: () => _onItemTapped(0),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.indigo[900],
                                ),
                                width: screenWidth / 4,
                                height: screenWidth / 4,
                                child: Icon(
                                  LineAwesomeIcons.user,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("EWF", style: builtinIndigoBoldFont),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Visibility(
                                      visible: true,
                                      child: Icon(
                                        Icons.verified_user,
                                        color: Colors.amber,
                                      )),
                                ],
                              ),
                              Text(email, style: builtinIndigoFont),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        height: screenHeigth * 3 / 7 + 30,
                        color: Colors.white,
                        child: ListView(
                          children: <Widget>[
                            Text(
                              'GENERAL',
                              style: builtinIndigoFont,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.indigo[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            LineAwesomeIcons.gear,
                                            size: 30,
                                            color: Colors.indigo[900],
                                          ),
                                        )),
                                  ),
                                  title: Text(
                                    'MAIN SETTINGS',
                                    style: builtinIndigoFontBig,
                                  ),
                                  subtitle: Text(
                                    'Update and modify your profile',
                                    style: builtinAppTextSmall,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => showMyDialog(
                                  context,
                                  NotFound("Sorry",
                                      "This fetaure will soon be available")),
                              child: Card(
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.indigo[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            LineAwesomeIcons.shield,
                                            size: 30,
                                            color: Colors.indigo[900],
                                          ),
                                        )),
                                  ),
                                  title: Text(
                                    'PRIVACY',
                                    style: builtinIndigoFontBig,
                                  ),
                                  subtitle: Text(
                                    'Modify your security settings',
                                    style: builtinAppTextSmall,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => showMyDialog(
                                  context,
                                  NotFound("Sorry",
                                      "This fetaure will soon be available")),
                              child: Card(
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.indigo[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            LineAwesomeIcons.bell,
                                            size: 30,
                                            color: Colors.indigo[900],
                                          ),
                                        )),
                                  ),
                                  title: Text(
                                    'NOTIFICATIONS',
                                    style: builtinIndigoFontBig,
                                  ),
                                  subtitle: Text(
                                    'Change your notification settings',
                                    style: builtinAppTextSmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    
      Future _onItemTapped(int index) async {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainUI()));
          } else if (_selectedIndex == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          } else {}
        });
      }
    }
    
    class UserMockViewModel {
}
