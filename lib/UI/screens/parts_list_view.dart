import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/Tiles/parts_card.dart';
import 'package:nodemappweb/Shared/part_AlertDialog.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class PartsListView extends StatefulWidget {
  @override
  _PartsListViewState createState() => _PartsListViewState();
}

class _PartsListViewState extends State<PartsListView> {
  Bikes bike;
  List<String> names = [];
  List<String> uuids = [];
  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    bike = _userViewModel.getSelectedBike;
    int numberofParts = _userViewModel.getNumberOfParts;
    names = getBikePartsName();
    uuids = getBikePartsUUID();

    //StaggeredGridView --> para hacerlo desuniforme
    return numberofParts == 0
        ? NoBPartsContainer()
        : Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemCount: _userViewModel.getNumberOfParts,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      showMyDialog(context,
                          PartAlertDialog(bike.name));
                          _userViewModel.setSelectedBikePart(names[index]);
                          _userViewModel.setPartUUID(uuids[index]);
                    },
                    onLongPress: () {},
                    child: PartCard(names[index], uuids[index]));
              },
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
}

class NoBPartsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: 150),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
                text:
                    " You don't have any parts in this bike yet. Let's create the first one",
                style: titleFontIndigo),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: RichText(
                  text: TextSpan(
                      text: " Create a new Bike part here",
                      style: titleFontIndigo),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(width: 20),
              Icon(
                LineAwesomeIcons.arrow_circle_down,
                size: 50,
                color: Colors.indigo[900],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
