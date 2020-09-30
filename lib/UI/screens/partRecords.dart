import 'package:flutter/material.dart';
import 'package:nodemappweb/Models/records.dart';
import 'package:nodemappweb/Shared/Tiles/record_tile.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class PartRecords extends StatefulWidget {
  final double parentHeight;
  final String uuid;

  PartRecords(this.parentHeight, this.uuid);

  @override
  _PartRecordsState createState() => _PartRecordsState();
}

class _PartRecordsState extends State<PartRecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.parentHeight,
      child: Column(
        children: <Widget>[
          Container(
            height: widget.parentHeight * 0.1,
            child: Center(
                child: Text(
              widget.uuid + " records  ",
              style: titleFontBlack,
            )),
          ),
          Divider(
            height: widget.parentHeight * 0.05,
          ),
          Container(
            height: widget.parentHeight * 0.85,
            child: Consumer<UserViewModel>(
              builder:
                  (BuildContext context, UserViewModel _userVM, Widget child) {
                var records = _userVM.getSelectedBike.bikeRecords;
                var currenType = _userVM.getSelectedBikePart;
                List<RecordsView> recordsT = [];
                for (var record in records) {
                  record.types == currenType
                      ? recordsT.add(record)
                      : print("nope");
                }
                return ListView.builder(
                  itemCount: recordsT.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecordTile(
                        recordsT[index].description +
                            " | " +
                            recordsT[index].types,
                        "bikeUUID: " + recordsT[index].bikeUuid);
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

class NoRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "There are no records yet",
      textAlign: TextAlign.justify,
      style: builtinIndigoFontBig,
    );
  }
}
