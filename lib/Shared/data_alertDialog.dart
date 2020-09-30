import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Services/Providers/config_navigation_provider.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/stateslist.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/UI/screens/view_data.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'modalBottomSheet.dart';
import 'not_found.dart';

class BikeAlertDialog extends StatelessWidget {
  final String type;
  final String uuid;
  bool _isLost = true;
  BikeAlertDialog(this.type, this.uuid);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
          shape: dialogShape,
          title: Row(
            children: <Widget>[
              Text(
                'Options',
                style: titleFontBlack,
              ),
              SizedBox(
                width: 110,
              ),
              Icon(LineAwesomeIcons.edit),
            ],
          ),
          content: Container(
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Consumer<UserViewModel>(
                    builder: (context, _userVM, child) {
                      return QrImage(
                        data: _userVM.getSelectedBike.uuid,
                        foregroundColor: Colors.indigo[900],
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 190,
                  child: Consumer<UserViewModel>(builder: (BuildContext context,
                      UserViewModel value, Widget child) {
                    var state = value.getSelectedBike.bikeStateId;
                    return ListView(
                      children: <Widget>[
                        Visibility(
                            visible: state == 4 || state == 5 ? false : true,
                            child: RoundedButton("Lost", 1)),
                        Visibility(
                            visible: state == 4 || state == 5 ? false : true,
                            child: RoundedButton("Stolen", 5)),
                        Visibility(
                            visible: state == 4 || state == 5 ? true : true,
                            child: RoundedButton("Got it back!", 6)),
                        RoundedButton("Sell/transfer", 2),
                        RoundedButton(type + " records", 3),
                        RoundedButton("Modify or add data", 4),
                      ],
                    );
                  }),
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
            )
          ]),
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
    BikeViewModel _bikeVM = Provider.of<BikeViewModel>(context);
    BikeStatesList _states = new BikeStatesList();
    return Container(
      width: 200,
      child: _isLoading == true
          ? LoadingForm()
          : RaisedButton(
              onPressed: () async {
                Bikes bike = _userVM.getSelectedBike;

                if (widget.selection == 1 || widget.selection == 5) {
                  if (widget.selection == 1) {
                    bike.setBikeId(4);
                  } else {
                    bike.setBikeId(5);
                  }
                  bool resp = await _bikeVM.updateBike(bike);
                  if (resp) {
                    _userVM.logInWithEmail(
                        _userVM.user.email, _userVM.user.password);
                  } else {
                    showMyDialog(context,
                        NotFound("Sorry", "We couldn't update your bike"));
                  }
                }
                if (widget.selection == 3) settingModalBottomSheet(context);
                if (widget.selection == 4) {
                  _navigationProvider.setCurrentIndex(1);
                  Navigator.of(context).pop(false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewData()));
                }
                if (widget.selection == 6) {
                  bike.setBikeId(3);
                  setState(() {
                    _isLoading = true;
                  });

                  bool resp = await _bikeVM.updateBike(bike);
                  if (resp) {
                    _userVM.logInWithEmail(
                        _userVM.user.email, _userVM.user.password);
                  } else {
                    showMyDialog(context,
                        NotFound("Sorry", "We couldn't update your bike"));
                  }
                  setState(() {
                    _isLoading = true;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                widget.text,
                style: roundButtonTextStyle,
              ),
              shape: cleanButtonShape,
              color: Colors.indigo[900],
            ),
    );
  }
}
