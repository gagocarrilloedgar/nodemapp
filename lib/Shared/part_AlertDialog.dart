import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/Providers/config_navigation_provider.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/showModalBottomPartSheet.dart';
import 'package:nodemappweb/Shared/stateslist.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/UI/screens/view_data.dart';
import 'package:nodemappweb/ViewModels/bikepartsViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'Tiles/part_tile.dart';

class PartAlertDialog extends StatefulWidget {
  final String partTitle;

  PartAlertDialog(this.partTitle);

  @override
  _PartAlertDialogState createState() => _PartAlertDialogState();
}

class _PartAlertDialogState extends State<PartAlertDialog> {
  BikeStatesList _statesList = new BikeStatesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: dialogShape,
        title: Container(
          child: Consumer<UserViewModel>(
            builder: (context, _userVM, child) {
              var bike = _userVM.getSelectedBike;
              var partname = _userVM.selectedBikePart;
              BikePartViewModel _bpartVM =
                  Provider.of<BikePartViewModel>(context);
              var part = _bpartVM.getBykePart(bike, partname);
              var state = part.partStateId;

              return PartTile(
                  "Bike name: " + widget.partTitle,
                  _userVM.getSelectedBikePart +
                      " | State: " +
                      _statesList.getbikeStates[state - 1].toLowerCase());
            },
          ),
        ),
        content: Container(
          height: 260,
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Consumer<UserViewModel>(
                  builder: (context, _userVM, child) {
                    return QrImage(
                      data: _userVM.getPartUUID,
                      foregroundColor: Colors.indigo[900],
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                child: Consumer<UserViewModel>(
                  builder: (context, UserViewModel value, child) {
                    var bike = value.getSelectedBike;
                    var partname = value.selectedBikePart;
                    BikePartViewModel _bpartVM =
                        Provider.of<BikePartViewModel>(context);
                    var part = _bpartVM.getBykePart(bike, partname);
                    var state = part.partStateId;
                    return ListView(
                      children: <Widget>[
                        Visibility(
                            visible: state == 4 || state == 5 ? false : true,
                            child: RoundedButton("Stolen", 1)),
                        Visibility(
                            visible: state == 4 || state == 5 ? false : true,
                            child: RoundedButton("Lost", 2)),
                        Visibility(
                            visible: state == 4 || state == 5 ? true : false,
                            child: RoundedButton("Got it back!", 6)),
                        RoundedButton("Sell/transfer", 4),
                        RoundedButton("See records", 3),
                        //RoundedButton("Modify or add data", 5),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Thanks',
              style: builtinIndigoFont,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  final String text;
  final int selection;

  RoundedButton(this.text, this.selection);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    ConfigNavigationProvider _navigationProvider =
        Provider.of<ConfigNavigationProvider>(context);
    UserViewModel _userVM = Provider.of<UserViewModel>(context);
    BikePartViewModel _partVM = Provider.of<BikePartViewModel>(context);
    return _isLoading == true
        ? LoadingForm()
        : RaisedButton(
            onPressed: () async {
              var part = _partVM.getBykePart(
                  _userVM.getSelectedBike, _userVM.getSelectedBikePart);
              if (widget.selection == 1 || widget.selection == 2) {
                if (widget.selection == 1) {
                  part.setBikeId(4);
                } else {
                  part.setBikeId(5);
                }
                setState(() {
                  _isLoading = true;
                });
                bool resp = await _partVM.updatePart(part);
                if (resp == true) {
                  _userVM.logInWithEmail(
                      _userVM.user.email, _userVM.user.password);
                  setState(() {
                    _isLoading = false;
                  });
                } else {
                  setState(() {
                    _isLoading = false;
                  });
                  showMyDialog(
                      context,
                      NotFound(
                          "Sorry", "We couldn't update your " + part.name));
                }
              }
              if (widget.selection == 3) {
                settingModalBottomPartSheet(context);
              }
              if (widget.selection == 4) {
                _navigationProvider.setCurrentIndex(2);
                Navigator.of(context).pop(false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewData()));
              }
              if (widget.selection == 6) {
                part.setBikeId(3);
                setState(() {
                  _isLoading = true;
                });
                bool resp = await _partVM.updatePart(part);
                if (resp == true) {
                  _userVM.logInWithEmail(
                      _userVM.user.email, _userVM.user.password);
                  setState(() {
                    _isLoading = false;
                  });
                } else {
                  setState(() {
                    _isLoading = false;
                  });
                  showMyDialog(
                      context,
                      NotFound(
                          "Sorry", "We couldn't update your " + part.name));
                }
              }
            },
            child: Text(
              widget.text,
              style: roundButtonTextStyle,
            ),
            shape: cleanButtonShape,
            color: Colors.indigo[900],
          );
  }
}
