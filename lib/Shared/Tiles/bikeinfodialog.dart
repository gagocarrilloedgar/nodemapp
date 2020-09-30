import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class BikeInfoDialog extends StatefulWidget {

  BikeInfoDialog();

  @override
  _BikeInfoDialogState createState() => _BikeInfoDialogState();
}

class _BikeInfoDialogState extends State<BikeInfoDialog> {
  final List<String> _bikeStates = ['New', 'Old', 'onUse', 'Lost', 'Stolen'];

  bool _isloading = false;
  Color colors;
  @override
  Widget build(BuildContext context) {
    BikeViewModel _bikeVM = Provider.of<BikeViewModel>(context);
    UserViewModel _userVM = Provider.of<UserViewModel>(context);
    _isloading = _bikeVM.getIsLoading;
    if(_userVM.getSelectedBike.bikeStateId == 4 || _userVM.getSelectedBike.bikeStateId == 5){
      setState(() {
         colors = Colors.amber[200];
      });
    }else{
      colors = Colors.white;
    }
    return AlertDialog(
      backgroundColor: colors,
      shape: dialogShape,
      title: Row(
        children: <Widget>[
          Text(
            "Nice",
            style: titleFontBlack,
          ),
          SizedBox(
            width: 150,
          ),
          Icon(LineAwesomeIcons.exclamation_circle),
        ],
      ),
      content: _isloading?LoadingForm(): SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              "Bike name: " + _bikeVM.getBikeToFind.name,
              style: builtinAppText,
            ),
            Divider(
              height: 5,
            ),
            Text(
              "Bike state: " + _bikeStates[_bikeVM.getBikeToFind.stateId],
              style: builtinAppText,
            ),
            Divider(
              height: 5,
            ),
            Text(
              "Bike uuid: " + _bikeVM.getBikeToFind.uuid,
              style: builtinAppText,
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
    );
  }
}
