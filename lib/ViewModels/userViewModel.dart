import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Models/records.dart';
import 'package:nodemappweb/Models/user.dart';
import 'package:nodemappweb/Services/Data/res_api.dart';

class UserViewModel extends ChangeNotifier {
  User user;
  String errorMessage;
  int selectedBike = 0;
  int numberOfParts = 0;
  String selectedBikePart = "frame";
  int selectedBikePartIndex = 0;
  String partUUID = "";

  Future<bool> logInWithEmail(String email, String password) async {
    var response = await RestDataSource().fetchUser(email, password);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var jsondecode = json.decode(response.body);
      //print("this is the user: "+ jsondecode);
      print(response.statusCode);
      setUser(User.fromJson(jsondecode));
      return true;
    } else {
      print("nope");
      return false;
    }
  }

  Future<bool> signInWithEmail(
      String name, String email, String phone, String password) async {
    var response =
        await RestDataSource().createNewUser(name, email, phone, password);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var jsondecode = json.decode(response.body);
      //print("this is the user: "+ jsondecode);
      print(response.statusCode);
      setUser(User.fromJson(jsondecode));
      return true;
    } else {
      print("nope");
      return false;
    }
  }

  void selectBike(value) {
    selectedBike = value;
    notifyListeners();
  }

  int get getSelectedBikeIndex => selectedBike;

  Bikes get getSelectedBike => user.getBikes[selectedBike];

  void setNumberOfParts(value) {
    numberOfParts = value;
    notifyListeners();
  }

  int get getNumberOfParts => numberOfParts;

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  void setUserBikes(value) {
    user.bikes = value;
    notifyListeners();
  }

  User get getUser => UserViewModel().user;

  List<Bikes> get getBikes => user.bikes;
  List<RecordsView> get getRecords => user.records;

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() => errorMessage;

  // Parts and bikes
  void setSelectedBikePart(val) {
    selectedBikePart = val;
    notifyListeners();
  }

  String get getSelectedBikePart => selectedBikePart;

  void setSelectedBikePartIndex(val) {
    selectedBikePartIndex = val;
    notifyListeners();
  }

  int get getSelectedBikePartIndex => selectedBikePartIndex;

  void setPartUUID(val) {
    partUUID = val;
    notifyListeners();
  }

  String get getPartUUID => partUUID;

  Future<bool> updateUser(User user) async {
    var response = await RestDataSource().updateUser(user);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print("User updated succesfully");
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
