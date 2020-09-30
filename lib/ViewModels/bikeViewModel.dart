import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Services/Data/res_api.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';

bool _areBikesLoaded = false;

class BikeViewModel extends ChangeNotifier {
  UserViewModel userViewModel;
  Bikes bike;
  Bikes foundBike;
  List<Bikes> stolenBikes;
  List<Bikes> lostBikes;
  bool _isloading = false;

  Future<bool> addBike(String frameid, String name, String userUuid,
      int modelId, int stateId) async {
    var response = await RestDataSource()
        .createNewBike(frameid, name, userUuid, modelId, stateId);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> addPart(String name, String bikeUuid, int stateId) async {
    var response =
        await RestDataSource().createNewPart(name, bikeUuid, stateId);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> getBikesByState() async {
    var response = await RestDataSource().getStolenBikes();
    var decodedResponse = (json.decode(response.body) as List)
        .map((i) => Bikes.fromJson(i))
        .toList();
    setBrands(decodedResponse);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> updateBike(Bikes bike) async {
    var response = await RestDataSource().updateBike(bike);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print("Upadted succesfully");
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  void setBrands(val) {
    stolenBikes = val;
  }

  List<Bikes> get getSolenBikes => stolenBikes;

  void setLoadedBikes(bool val) {
    _areBikesLoaded = val;
    notifyListeners();
  }

  bool get getAreBikesLoaded => _areBikesLoaded;

  Future<bool> getBikeByUUID(String uuid) async {
    var response = await RestDataSource().getBikeByUUID(uuid);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var jsondecode = json.decode(response.body);
      print(response.statusCode);
      setBikeToFind(Bikes.fromJson(jsondecode));
      return true;
    } else {
      return false;
    }
  }

  void setBikeToFind(val) {
    foundBike = val;
    notifyListeners();
  }

  Bikes get getBikeToFind => foundBike;

  void setIsLoading(val) {
    _isloading = val;
    notifyListeners();
  }

  bool get getIsLoading => _isloading;
}
