import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nodemappweb/Models/Parts/battery.dart';
import 'package:nodemappweb/Models/Parts/fork.dart';
import 'package:nodemappweb/Models/Parts/frame.dart';
import 'package:nodemappweb/Models/Parts/fwheel.dart';
import 'package:nodemappweb/Models/Parts/motor.dart';
import 'package:nodemappweb/Models/Parts/rwheel.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Models/user.dart';

class RestDataSource extends ChangeNotifier {
  static final String baseURL = "https://nodemwebapi.azurewebsites.net/api";
  static final String blockChainURL =
      "https://rinkeby.infura.io/v3/199fd3a6669848f3849594199d2dcaa3";
  static final String loginURL = baseURL + "/login";
  static final String findOneFull = baseURL + "/findone";
  static final String signIn = baseURL + "/newuser";
  static final String getBrandsURL = baseURL + "/brands";
  static final String createBike = baseURL + "/newbike";
  static final String getStolenBikesURL = baseURL + "/bikesbystate/4";
  static final String searchBikeByUUID = baseURL + "/bikes/findone/";
  static final String updateBikeURL = baseURL + "/bikes/update/";
  static final String updateForkURL = baseURL + "/fork/update/";
  static final String updateFrameURL = baseURL + "/frame/update/";
  static final String updateBatteryURL = baseURL + "/battery/update/";
  static final String updateMotorURL = baseURL + "/motor/update/";
  static final String updateFWheelURL = baseURL + "/fwheel/update/";
  static final String updateRWheelURL = baseURL + "/rwheel/update/";
  static final String updateUserURL = baseURL + "/users/update/";

  //static final _API_KEY = "somerandomkey";

  Future<http.Response> fetchUser(String email, String password) =>
      http.post(loginURL, body: {'email': email, 'password': password});

  Future<http.Response> getUsers(String uuid) =>
      http.post(findOneFull, body: {'uuid': uuid});

  Future<http.Response> createNewUser(
          String name, String email, String phone, String password) =>
      http.post(signIn, body: {
        "name": name,
        "password": password,
        "last_name": " ",
        "user_name": " ",
        "email": email,
        "id_doc": " ",
        "phone": phone
      });

  Future<http.Response> updateUser(User user) => http.put(updateUserURL, body: {
        "name": user.name,
        "password": user.password,
        "last_name": user.getuserLastName,
        "user_name": user.getUserName,
        "email": user.getEmail,
        "id_doc": user.getIdDoc,
        "phone": user.getPhone
      });

  Future<http.Response> createNewBike(
      String frameid, String name, String userUuid, int modelId, int stateId) {
    var body = {
      "frameid": frameid,
      "name": name,
      "userUuid": userUuid,
      "modelId": modelId.toString(),
      "stateId": stateId.toString()
    };
    print(body);
    var resp = http.post(
      createBike,
      body: body,
    );
    return resp;
  }

  Future<http.Response> createNewPart(
      String name, String bikeUuid, int stateId) {
    var addPartURL = "";
    var now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    if (name == "Frame") {
      addPartURL = baseURL + "/newframe";
    }
    if (name == "Fork") {
      addPartURL = baseURL + "/newfork";
    }
    if (name == "Motor") {
      addPartURL = baseURL + "/newmotor";
    }
    if (name == "Battery") {
      addPartURL = baseURL + "/newbattery";
    }
    if (name == "Rear wheel") {
      addPartURL = baseURL + "/newrwheel";
    }
    if (name == "Front wheel") {
      addPartURL = baseURL + "/newfwheel";
    }
    var body = {
      "name": name,
      "price": 0.toString(),
      "date_of_production": formattedDate.toString(),
      "image": "none",
      "providerId": 1.toString(),
      "stateId": stateId.toString(),
      "bikeUuid": bikeUuid
    };
    print(body);
    var resp = http.post(
      addPartURL,
      body: body,
    );

    return resp;
  }

  Future<http.Response> getBrands() => http.get(getBrandsURL);

  Future<http.Response> getStolenBikes() => http.get(getStolenBikesURL);

  Future<http.Response> getBikeByUUID(var uuid) =>
      http.get(searchBikeByUUID + uuid);

  Future<http.Response> updateBike(Bikes instance) =>
      http.put(updateBikeURL + instance.bikeUUID, body: {
        'frameid': instance.bikeFrameId,
        'name': instance.bikeName,
        'userUuid': instance.bikeUserUUID,
        'modelId': instance.bikeModelID.toString(),
        'stateId': instance.stateId.toString(),
      });

  Future<http.Response> updateBattery(Battery instance) {
    var url = updateBatteryURL + instance.partUUID;
    return http.put(url, body: {
      'name': instance.partName,
      'price': instance.partPrice.toString(),
      'image': instance.partImage,
      'providerId': instance.partProviderId.toString(),
      'stateId': instance.partStateId.toString(),
      'bikeUuid': instance.partBikeUUID,
    });
  }

  Future<http.Response> updateFork(Fork instance) =>
      http.put(updateForkURL + instance.uuid, body: {
        'name': instance.partName,
        'price': instance.partPrice.toString(),
        'image': instance.partImage,
        'providerId': instance.partProviderId.toString(),
        'stateId': instance.partStateId.toString(),
        'bikeUuid': instance.partBikeUUID,
      });

  Future<http.Response> updateFrame(Frame instance) =>
      http.put(updateFrameURL + instance.uuid, body: {
        'name': instance.partName,
        'price': instance.partPrice.toString(),
        'image': instance.partImage,
        'providerId': instance.partProviderId.toString(),
        'stateId': instance.partStateId.toString(),
        'bikeUuid': instance.partBikeUUID,
      });

  Future<http.Response> updateMotor(Motor instance) =>
      http.put(updateMotorURL + instance.uuid, body: {
        'name': instance.partName,
        'price': instance.partPrice.toString(),
        'image': instance.partImage,
        'providerId': instance.partProviderId.toString(),
        'stateId': instance.partStateId.toString(),
        'bikeUuid': instance.partBikeUUID,
      });

  Future<http.Response> updateRWheel(Rwheel instance) =>
      http.put(updateRWheelURL + instance.uuid, body: {
        'name': instance.partName,
        'price': instance.partPrice.toString(),
        'image': instance.partImage,
        'providerId': instance.partProviderId.toString(),
        'stateId': instance.partStateId.toString(),
        'bikeUuid': instance.partBikeUUID,
      });

  Future<http.Response> updateFWheel(Fwheel instance) =>
      http.put(updateFWheelURL + instance.uuid, body: {
        'name': instance.partName,
        'price': instance.partPrice.toString(),
        'image': instance.partImage,
        'providerId': instance.partProviderId.toString(),
        'stateId': instance.partStateId.toString(),
        'bikeUuid': instance.partBikeUUID,
      });
}
