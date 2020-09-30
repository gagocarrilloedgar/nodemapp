import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/vendors/brand.dart';
import 'package:nodemappweb/Models/vendors/models.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:nodemappweb/ViewModels/brandViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class AddBikeDialog extends StatefulWidget {
  @override
  _AddBikeDialogState createState() => _AddBikeDialogState();
}

class _AddBikeDialogState extends State<AddBikeDialog> {
  String text = "Please fill the from to create a new bike";
  String title = "Add your bike";

  bool _isloading = false;
  String name;
  String brand;
  int modelId;
  int stateId;
  int brandId = 0;
  String frameNumber;
  List<String> _bikeStates = [
    'New',
    'Old',
    'onUse',
    'Lost',
    'Stolen'
  ]; // Option 2
  String _selectedBikeState; // Option 2
  String _selectedBikeModel; // Option 2
  List<Brand> _bikeBrands;
  List<Models> _bikeModels; //
  // Option 2
  String _selectedBikeBrand; // Option 2
  bool _changeShape1 = false;
  bool _changeShape2 = false;
  bool _changeShape3 = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenWidht = MediaQuery.of(context).size.width.toDouble();
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    BikeViewModel _bikeViewModel = Provider.of<BikeViewModel>(context);
    _bikeBrands = _brandViewModel.getBrands;
    _bikeModels = _bikeBrands[brandId].models;
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
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              _changeShape1 = false;
                              _changeShape2 = false;
                              _changeShape3 = false;
                            });
                          },
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Frame number'),
                          validator: (val) => val.isEmpty
                              ? "Enter your bike's frame number"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              frameNumber = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              _changeShape1 = false;
                              _changeShape2 = false;
                              _changeShape3 = false;
                            });
                          },
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Bike name'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: _changeShape1 == true
                            ? dropDownFocusMenuShape
                            : dropDownMenuShape,
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: DropdownButton(
                            elevation: 4,
                            isExpanded: true,
                            hint: Text(
                                "Please choose a brand"), // Not necessary for Option 1
                            value: _selectedBikeBrand,
                            onTap: () {
                              setState(() {
                                _changeShape2 = false;
                                _changeShape1 = true;
                                _changeShape3 = false;
                              });
                            },
                            onChanged: (newValue) {
                              setState(() {
                                _selectedBikeBrand = newValue;
                                brandId = _bikeBrands.indexOf(newValue);
                              });
                            },
                            items: _bikeBrands.map((brand) {
                              return DropdownMenuItem(
                                child: Text(brand.name),
                                value: brand.name,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: _changeShape2 == true
                            ? dropDownFocusMenuShape
                            : dropDownMenuShape,
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text(
                                "Please choose the a bike model"), // Not necessary for Option 1
                            value: _selectedBikeModel,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedBikeModel = newValue;
                                for (var model in _bikeModels) {
                                  if (model.name == newValue) {
                                    modelId = _bikeModels.indexOf(model);
                                  }
                                }
                              });
                            },
                            onTap: () {
                              setState(() {
                                _changeShape2 = true;
                                _changeShape1 = false;
                                _changeShape3 = false;
                              });
                            },
                            items: _bikeModels.map((model) {
                              return DropdownMenuItem(
                                child: Text(model.name),
                                value: model.name,
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
                                "Please choose the bike's current state"), // Not necessary for Option 1
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
                                _changeShape1 = false;
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
            var jsond = json.encode({
              "name": "$name",
              "modelId": "$modelId",
            });
            print(jsond);
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
              bool result = await _bikeViewModel.addBike(frameNumber, name,
                  _userViewModel.user.uuid, modelId + 1, stateId + 1);
              if (result == true) {
                var resp = await _userViewModel.logInWithEmail(
                    _userViewModel.user.email, _userViewModel.user.password);
                if (resp == true) {
                  setState(() {
                    _isloading = false;
                  });
                  Navigator.of(context).pop();
                } else {
                  _isloading = false;
                  showMyDialog(
                    context,
                    NotFound("Sorry",
                        "We haven't been able to update your bikes. Please try login again."),
                  );
                }
              } else {
                setState(() {
                  _isloading = false;
                });
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
