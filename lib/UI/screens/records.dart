import 'package:flutter/material.dart';
import 'package:nodemappweb/Models/records.dart';
import 'package:nodemappweb/Shared/Tiles/record_tile.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<RecordsView> records = [];
  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    records = _userViewModel.getSelectedBike.bikeRecords;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
                child: Text(
              _userViewModel.getSelectedBike.name + " records  ",
              style: titleFontBlack,
            )),
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Consumer<UserViewModel>(
              builder:
                  (BuildContext context, UserViewModel _userVM, Widget child) {
                var records = _userVM.getSelectedBike.bikeRecords;
                var userrecords = _userVM.user.getRecords.where((element) => element.bikeUuid ==_userVM.getSelectedBike.bikeUUID).toList();
                var totalRecords = records + userrecords;
                return ListView.builder(
                  itemCount: totalRecords.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecordTile(
                        totalRecords[index].description + " | " + totalRecords[index].types,
                         "Bike UUID: "+ (totalRecords[index].bikeUuid == null ? " " : totalRecords[index].bikeUuid ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
