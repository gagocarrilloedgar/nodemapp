import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/vendors/brand.dart';
import 'package:nodemappweb/Models/vendors/models.dart';
import 'package:nodemappweb/Shared/Tiles/data_card.dart';
import 'package:nodemappweb/Shared/Tiles/fixed_data_card.dart';
import 'package:nodemappweb/Shared/Tiles/view_data_card.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/ViewModels/brandViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class ConfigBike extends StatefulWidget {
  @override
  _ConfigBikeState createState() => _ConfigBikeState();
}

class _ConfigBikeState extends State<ConfigBike> {
  final List<String> cardTitles = [
    "Bike unique ID",
    "Brand",
    "Model",
    "Type",
    "Warranty ID",
    "Certificate",
  ];

  final List<IconData> cardIcons = [
    LineAwesomeIcons.bicycle,
    LineAwesomeIcons.bicycle,
    LineAwesomeIcons.bicycle,
    LineAwesomeIcons.phone,
    LineAwesomeIcons.credit_card,
  ];

  final List<IconData> fixedcardIcons = [
    LineAwesomeIcons.link,
    LineAwesomeIcons.file_pdf_o,
    LineAwesomeIcons.certificate,
    LineAwesomeIcons.user
  ];
  //List<Bikes> _bikes = []; // Option 2
  List<Brand> _brands = [];
  List<Models> _models = [];
  String _selectedLocation; // Option 2

  int _selectedBikeIndex = 0;
  int _selectedBikeBrand = 0;
  int _selectedModelId = 0;
  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    var _bikes =  _userViewModel.user.getBikes;
    _brands = _brandViewModel.getBrands;
    _models = _brands[_selectedBikeBrand].models;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text(
                        'Please choose a bike'), // Not necessary for Option 1
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                        for (var item in _bikes) {
                          if (item.uuid == newValue) {
                            _selectedBikeIndex = _bikes.indexOf(item);
                            _selectedModelId =
                                _bikes[_selectedBikeIndex].modelId;
                          }
                        }
                        for (var item in _brands) {
                          for (var model in item.models) {
                            if (model.id ==
                                _bikes[_selectedBikeIndex].modelId) {
                              _selectedBikeBrand = _brands.indexOf(item);
                            }
                          }
                        }
                      });
                    },
                    items: _bikes.map((bike) {
                      return DropdownMenuItem(
                        child: Text(
                          bike.bikeUUID,
                          style: builtinIndigoFont,
                        ),
                        value: bike.bikeUUID,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 170,
              child: ListView(
                children: <Widget>[
                  FixedDataCard(
                      "User uuid", fixedcardIcons[3], _userViewModel.user.uuid),
                  Divider(
                    height: 0,
                  ),
                  FixedDataCard(
                      "Bike uuid",
                      fixedcardIcons[0],
                      _bikes.isEmpty
                          ? " You don't have any bikes yet"
                          : _bikes[_selectedBikeIndex].uuid),
                  Divider(
                    height: 0,
                  ),
                  DataCard(
                      cardTitles[1],
                      cardIcons[1],
                      _bikes.isEmpty
                          ? "You don't have any brands yet "
                          : _brands[_selectedBikeBrand].name),
                  Divider(
                    height: 0,
                  ),
                  DataCard(
                      cardTitles[2],
                      cardIcons[2],
                      _bikes.isEmpty
                          ? "You don't have any models yet "
                          : _models[_selectedModelId == 0
                                  ? 0
                                  : _selectedModelId - 1]
                              .name),
                  Divider(
                    height: 0,
                  ),
                  ViewDataCard(
                      "Bike warranty",
                      fixedcardIcons[1],
                      _bikes.isEmpty
                          ? "You don't have any bikes yet "
                          : _userViewModel.user.name +
                              "warranty" +
                              (_selectedBikeIndex + 1).toString()),
                  Divider(
                    height: 0,
                  ),
                  ViewDataCard(
                      "Ownership certificate", fixedcardIcons[2], "Download"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
