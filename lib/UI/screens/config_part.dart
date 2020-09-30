import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Shared/Tiles/data_card.dart';
import 'package:nodemappweb/Shared/Tiles/fixed_data_card.dart';
import 'package:nodemappweb/Shared/Tiles/view_data_card.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class ConfigParts extends StatefulWidget {
  @override
  _ConfigPartsState createState() => _ConfigPartsState();
}

class _ConfigPartsState extends State<ConfigParts> {
  final List<String> cardTitles = [
    "Bike unique ID",
    "Brand",
    "Model",
    "Type",
    "Warranty ID",
    "Certificate",
  ];

  List<String> _bikeStates = ['New', 'Old', 'onUse', 'Lost', 'Stolen'];

  final List<IconData> cardIcons = [
    LineAwesomeIcons.bicycle,
    LineAwesomeIcons.phone,
    LineAwesomeIcons.credit_card,
    LineAwesomeIcons.gear,
    Icons.track_changes,
    LineAwesomeIcons.calendar_check_o,
  ];

  final List<IconData> fixedcardIcons = [
    LineAwesomeIcons.link,
    LineAwesomeIcons.file_pdf_o,
    LineAwesomeIcons.certificate,
    LineAwesomeIcons.user,
  ];

  List<Bikes> _bikes = [];

  Bikes bike;
  List<String> _parts = [];
  List<String> _uuid = [];
  List<int> _statesId = [];
  List<String> _lastUpdates = [];
  //String _selectedpart = " ";
  //int _selectedpartindex = 0;

  @override
  Widget build(BuildContext context) {
    // Proviers
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    _bikes = _userViewModel.user.getBikes;
    bike = _bikes.isEmpty? null : _userViewModel.getSelectedBike;
    _parts = _bikes.isEmpty? [] : getBikePartsName();
    _uuid =  _bikes.isEmpty? [] :getBikePartsUUID();
    _statesId =  _bikes.isEmpty? [] :getBikePartsStates();
    _lastUpdates = _bikes.isEmpty? [] : getBikePartsLastUpdates();
    //Providers}

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: DropdownButton(
                  hint: Text('Choose a bike'), // Not necessary for Option 1
                  value: _selectedbike,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedbike = newValue;
                      for (var item in _bikes) {
                        if (item.name == newValue) {
                          _userViewModel.selectBike(_bikes.indexOf(item));
                        }
                      }
                    });
                  },
                  items: _bikes.map((bike) {
                    return DropdownMenuItem(
                      child: Text(bike.name),
                      value: bike.name,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: DropdownButton(
                  hint:
                      Text('Choose a bike part'), // Not necessary for Option 1
                  value: _selectedpart,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedpart = newValue;
                      _userViewModel
                          .setSelectedBikePartIndex(_parts.indexOf(newValue));
                    });
                  },
                  items: _parts.map((part) {
                    return DropdownMenuItem(
                      child: Text(part),
                      value: part,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),*/
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 170,
              child: ListView(
                children: <Widget>[
                  FixedDataCard(
                      "Bike uuid",
                      fixedcardIcons[0],
                      _bikes.isEmpty ? " ": 
                      _userViewModel.user
                          .bikes[_userViewModel.getSelectedBikeIndex].uuid),
                  Divider(
                    height: 0,
                  ),
                  FixedDataCard("Part uuid", fixedcardIcons[0],
                      _bikes.isEmpty ? " ": _uuid[_userViewModel.getSelectedBikePartIndex]),
                  Divider(
                    height: 0,
                  ),
                  DataCard(
                      "Name",
                      cardIcons[3],
                      _bikes.isEmpty ? " ": _parts[_userViewModel.getSelectedBikePartIndex]),
                  Divider(
                    height: 0,
                  ),
                  DataCard("State", cardIcons[4],
                      _bikes.isEmpty ? " ": _bikeStates[_userViewModel.getSelectedBikePartIndex]),
                  Divider(
                    height: 0,
                  ),
                  /*DataCard("Last update", cardIcons[5], _lastUpdates[_userViewModel.getSelectedBikePartIndex]),
                  Divider(
                    height: 0,
                  ),*/
                  ViewDataCard(
                     _bikes.isEmpty ? " ":  _parts[_userViewModel.getSelectedBikePartIndex] +
                          "warranty",
                      fixedcardIcons[1],
                      "identifier"),
                  Divider(
                    height: 0,
                  ),
                  ViewDataCard(
                      "Ownership certificate", fixedcardIcons[2], "user"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> getBikePartsName() {
    List<String> list = [];
    bike.frame == null ? print("null") : list.add(bike.frame.name);
    bike.fork == null ? print("null") : list.add(bike.fork.name);
    bike.battery == null ? print("null") : list.add(bike.battery.name);
    bike.motor == null ? print("null") : list.add(bike.motor.name);
    bike.fwheel == null ? print("null") : list.add(bike.fwheel.name);
    bike.rwheel == null ? print("null") : list.add(bike.rwheel.name);
    return list;
  }

  List<String> getBikePartsUUID() {
    List<String> list = [];
    bike.frame == null ? print("null") : list.add(bike.frame.uuid);
    bike.fork == null ? print("null") : list.add(bike.fork.uuid);
    bike.battery == null ? print("null") : list.add(bike.battery.uuid);
    bike.motor == null ? print("null") : list.add(bike.motor.uuid);
    bike.fwheel == null ? print("null") : list.add(bike.fwheel.uuid);
    bike.rwheel == null ? print("null") : list.add(bike.rwheel.uuid);
    return list;
  }

  List<int> getBikePartsStates() {
    List<int> list = [];
    bike.frame == null ? print("null") : list.add(bike.frame.stateId);
    bike.fork == null ? print("null") : list.add(bike.fork.stateId);
    bike.battery == null ? print("null") : list.add(bike.battery.stateId);
    bike.motor == null ? print("null") : list.add(bike.motor.stateId);
    bike.fwheel == null ? print("null") : list.add(bike.fwheel.stateId);
    bike.rwheel == null ? print("null") : list.add(bike.rwheel.stateId);
    return list;
  }

  List<String> getBikePartsLastUpdates() {
    List<String> list = [];
    bike.frame == null ? print("null") : list.add(bike.frame.updatedAt);
    bike.fork == null ? print("null") : list.add(bike.fork.updatedAt);
    bike.battery == null ? print("null") : list.add(bike.battery.updatedAt);
    bike.motor == null ? print("null") : list.add(bike.motor.updatedAt);
    bike.fwheel == null ? print("null") : list.add(bike.fwheel.updatedAt);
    bike.rwheel == null ? print("null") : list.add(bike.rwheel.updatedAt);
    return list;
  }
}
