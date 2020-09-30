import 'package:flutter/material.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/stolen_bike_card.dart';
import 'package:nodemappweb/Shared/stolen_bike_dialog.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/ViewModels/bikeViewModel.dart';
import 'package:provider/provider.dart';

class StolenBikesScreen extends StatefulWidget {
  @override
  _StolenBikesScreenState createState() => _StolenBikesScreenState();
}

class _StolenBikesScreenState extends State<StolenBikesScreen> {

  List<Bikes> stolenBikes;
  bool _isloading = false;
  @override
  void initState() {
    super.initState();
    _initPopUp();
  }

  Future _initPopUp() async {
    await Future.delayed(Duration(milliseconds: 50));
    showMyDialog(
        context,
        StolenBikeDialog("Hey there!",
            "In this section you'll find bikes that have been marked as stolen. Please contact with the user if you've seen them. You'll get nodem points for it!"));
  }

  @override
  Widget build(BuildContext context) {
    BikeViewModel _bikeVM = Provider.of<BikeViewModel>(context);

    Future _loadBikes() async {
      setState(() {
        _isloading = true;
      });
      var res = await _bikeVM.getBikesByState();
      if (res == true) {
        setState(() {
          _isloading = false;
        });
        _bikeVM.setLoadedBikes(true);
        print("loading stolen bikes");
      } else {
        setState(() {
          _isloading = false;
        });
        showMyDialog(
            context, NotFound("Sorry", "We coudln't fetch the stolen bikes"));
      }
      print("Are bikes loaded? " + _bikeVM.getAreBikesLoaded.toString());
    }

    stolenBikes = _bikeVM.getSolenBikes;

    _bikeVM.getAreBikesLoaded == true
        ? print("bike are already loaded!")
        : _loadBikes();
    return _isloading == true
        ? Container()
        : GestureDetector(
          onDoubleTap: () => _loadBikes(),
            child: ListView.builder(
              itemCount: stolenBikes.length,
              itemBuilder: (BuildContext context, int index) {
                return StolenBikeCard(
                    stolenBikes[index].name, stolenBikes[index].uuid);
              },
            ),
          );
  }
}

class EmptyBikesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "There are no current stolen nor lost bikes at the moment",
            style: titleFontIndigo,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
