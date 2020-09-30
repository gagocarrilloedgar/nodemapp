import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Models/user.dart';
import 'package:nodemappweb/Models/vendors/brand.dart';
import 'package:nodemappweb/Services/Providers/config_navigation_provider.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/Tiles/bike_card.dart';
import 'package:nodemappweb/Shared/data_alertDialog.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/screens/parts_list_view.dart';
import 'package:nodemappweb/ViewModels/brandViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

class BikesGridView extends StatefulWidget {
  @override
  _BikesGridViewState createState() => _BikesGridViewState();
}

class _BikesGridViewState extends State<BikesGridView> {
  User user;
  List<Bikes> bikes;
  List<Brand> brands;
  @override
  Widget build(BuildContext context) {
    ConfigNavigationProvider _navigationProvider =
        Provider.of<ConfigNavigationProvider>(context);
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    user = _userViewModel.getUser;
    bikes = _userViewModel.getBikes;
    brands = _brandViewModel.getBrands;
    int numberofbikes = bikes == null ? 0 : bikes.length;
    return Scaffold(
      body: numberofbikes == 0
          ? NoBikesContainer()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemCount: numberofbikes,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _userViewModel.selectBike(index);
                    _userViewModel
                        .setNumberOfParts(_getLenght(index, bikes[index]));
                    print(_userViewModel.getNumberOfParts);
                    _settingModalBottomSheet(context);
                  },
                  onLongPress: () {
                    _userViewModel.selectBike(index);
                    _navigationProvider.setCurrentIndex(0);
                     _navigationProvider
                        .setConfigSelectedBikeIndex(index);
                    _navigationProvider
                        .setConfigSelectedModelId(bikes[index].modelId);
                    for (var item in brands) {
                      for (var model in item.models) {
                        if (model.id == bikes[index].modelId) {
                          _navigationProvider
                              .setConfigSelectedBikeBrand(brands.indexOf(item));
                        }
                      }
                    }
                    showMyDialog(
                        context,
                        BikeAlertDialog(
                            bikes[index].name,
                            _getLenght(index, bikes[index]).toString() +
                                " parts"));
                  },
                  child: BikeCard(
                      bikes[index].name,
                      _getLenght(index, bikes[index]).toString() + " parts",
                      100),
                );
              },
            ),
    );
  }

  void _settingModalBottomSheet(context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return PartsListView();
        });
  }

  int _getLenght(int index, Bikes bike) {
    int count = 0;
    if (bike.frame != null) {
      count++;
    }
    if (bike.fork != null) {
      count++;
    }
    if (bike.battery != null) {
      count++;
    }
    if (bike.motor != null) {
      count++;
    }
    if (bike.fwheel != null) {
      count++;
    }
    if (bike.rwheel != null) {
      count++;
    }

    return count;
  }
}

class NoBikesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
                text:
                    " You don't have any bikes yet. Let's create the first one",
                style: titleFontIndigo),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Create a new bike here', style: titleFontIndigo),
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
