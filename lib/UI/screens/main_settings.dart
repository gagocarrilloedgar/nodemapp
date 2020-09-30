import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/user.dart';
import 'package:nodemappweb/Shared/Tiles/data_card.dart';
import 'package:nodemappweb/Shared/Tiles/fixed_data_card.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class MainSetttingsScreen extends StatefulWidget {
  @override
  _MainSetttingsScreenState createState() => _MainSetttingsScreenState();
}

class _MainSetttingsScreenState extends State<MainSetttingsScreen> {
  final List<String> cardTitles = [
    "Name",
    "Last name",
    "Email",
    "Phone",
    "ID",
  ];

  final List<IconData> cardIcons = [
    LineAwesomeIcons.user,
    LineAwesomeIcons.user,
    LineAwesomeIcons.at,
    LineAwesomeIcons.phone,
    LineAwesomeIcons.credit_card,
  ];

  final List<IconData> fixedcardIcons = [LineAwesomeIcons.link];

  User user;

  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    user = _userViewModel.user;
    print(user.user_name);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
              child: Container(
                  height: 40,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("Save user data"),
                  ))),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 165,
              child: ListView(
                children: <Widget>[
                  FixedDataCard("User uuid:", fixedcardIcons[0], user.uuid),
                  DataCard(cardTitles[0], cardIcons[0], user.name),
                  DataCard(cardTitles[1], cardIcons[1], user.last_name),
                  DataCard(cardTitles[2], cardIcons[2], user.email),
                  DataCard(cardTitles[3], cardIcons[3], user.phone),
                  DataCard(cardTitles[4], cardIcons[4], user.id_doc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
