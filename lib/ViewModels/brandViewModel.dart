import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nodemappweb/Models/vendors/brand.dart';
import 'package:nodemappweb/Services/Data/res_api.dart';

class BrandViewModel extends ChangeNotifier{

  List<Brand> brandList;

  Future<bool> getBrandsFromDB() async {
    var response = await RestDataSource().getBrands();
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var decodedResponse =(json.decode(response.body) as List).map((i) =>
              Brand.fromJson(i)).toList();
      setBrands(decodedResponse);
      print(brandList[0].id);
      return true;
    } else {
      print("nope");
      return false;
    }
  }

  void setBrands(val) {
    brandList = val;
  }
  

  List<Brand> get getBrands =>  brandList;



}