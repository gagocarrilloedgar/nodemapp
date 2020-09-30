import 'package:flutter/cupertino.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Services/Data/res_api.dart';

class BikePartViewModel extends ChangeNotifier {
  Future<bool> updatePart(var part) async {
    var response;
    switch (part.partName) {
      case "Frame":
        response = await RestDataSource().updateFrame(part);
        break;
      case "Motor":
        response = await RestDataSource().updateMotor(part);
        break;
      case "Fork":
        response = await RestDataSource().updateFork(part);
        break;
      case "Battery":
        response = await RestDataSource().updateBattery(part);
        break;
      case "Rear wheel":
        response = await RestDataSource().updateRWheel(part);
        break;
      case "Front wheel":
        response = await RestDataSource().updateFWheel(part);
        break;
      default:
        print("Bike part not found");
        break;
    }

    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(part.name + " upadted succesfully");
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  dynamic getBykePart(Bikes bike, var part) {
    switch (part) {
      case "Frame":
        return bike.bikeFrame;
        break;
      case "Motor":
        return bike.bikeMotor;
        break;
      case "Fork":
        return bike.bikeFork;
        break;
      case "Battery":
        return bike.bikeBattery;
        break;
      case "Rear wheel":
        return bike.bikeRWheel;
        break;
      case "Front wheel":
        return bike.bikeFWheel;
        break;
      default:
        print("Bike part not found");
        break;
    }
  }
}
