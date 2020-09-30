import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class AddPartDialog extends StatefulWidget {
  @override
  _AddPartDialogState createState() => _AddPartDialogState();
}

class _AddPartDialogState extends State<AddPartDialog> {
  String text = "Please fill the from to create a new bike";
  String title = "Add bike part";

  bool _isloading = false;
  String name;
  int stateId;
  List<String> _bikeStates = ['New','onUse','Old', 'Stolen', 'Lost','Other'];
  List<String> _bikeTypes = [
    'Frame',
    'Fork',
    'Motor',
    'Battery',
    'Rear wheel',
    'Front wheel'
  ]; // Option 2
  String _selectedBikeState; // Option 2
  String _selectedPartType; // Option 2

  // Option 2
  bool _changeShape3 = false;
  bool _changeShape2 = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenWidht = MediaQuery.of(context).size.width.toDouble();
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    BikeViewModel _bikeViewModel = Provider.of<BikeViewModel>(context);
    int currentBike = _userViewModel.selectedBike;
    return AlertDialog(
      shape: dialogShape,
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: titleFontBlack,
          ),
          SizedBox(
            width: 40,
          ),
          Icon(LineAwesomeIcons.plus_circle),
        ],
      ),
      content: _isloading == true
          ? LoadingForm()
          : Container(
              child: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: _changeShape3 == true
                            ? dropDownFocusMenuShape
                            : dropDownMenuShape,
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text(
                                "Please choose the part's type"), // Not necessary for Option 1
                            value: _selectedPartType,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedPartType = newValue;
                                name = newValue;
                              });
                            },
                            onTap: () {
                              setState(() {
                                _changeShape2 = true;
                                _changeShape3 = false;
                              });
                            },
                            items: _bikeTypes.map((location) {
                              return DropdownMenuItem(
                                child: Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: _changeShape3 == true
                            ? dropDownFocusMenuShape
                            : dropDownMenuShape,
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text(
                                "Please choose the part's current state"), // Not necessary for Option 1
                            value: _selectedBikeState,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedBikeState = newValue;
                                stateId = _bikeStates.indexOf(newValue);
                              });
                            },
                            onTap: () {
                              setState(() {
                                _changeShape2 = false;
                                _changeShape3 = true;
                              });
                            },
                            items: _bikeStates.map((location) {
                              return DropdownMenuItem(
                                child: Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Close ',
            style: builtinIndigoFont,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            'Create bike',
            style: builtinIndigoFont,
          ),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              setState(() {
                _isloading = true;
              });
              //Create method
              bool result = await _bikeViewModel.addPart(name,
                  _userViewModel.user.bikes[currentBike].uuid, stateId + 1);
              if (result == true) {
                var resp = await _userViewModel.logInWithEmail(
                    _userViewModel.user.email, _userViewModel.user.password);
                if (resp == true) {
                  setState(() {
                    _isloading = false;
                  });
                } else {
                  _isloading = false;
                  showMyDialog(
                    context,
                    NotFound("Sorry",
                        "We haven't been able to update your bikes. Please try login again."),
                  );
                }
                Navigator.of(context).pop();
              } else {
                setState(() {
                  _isloading = false;
                });
                Navigator.of(context).pop();
                showMyDialog(
                  context,
                  NotFound("Sorry", "We haven't been able to create your bike"),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
