import 'package:flutter/material.dart';

class ConfigNavigationProvider extends ChangeNotifier {
  int navigationScreen;
  bool isPartListScreen;
  final bikeFormKey = GlobalKey<FormState>(); // form validation key

  void setCurrentIndex(int val) {
    navigationScreen = val;
    notifyListeners();
  }

  void setPartListScreen(val) {
    isPartListScreen = val;
    notifyListeners();
  }

  int get getCurrenIndex => navigationScreen;
  bool get isPartListScreenTrue => isPartListScreen;

  int configSelectedBikeIndex;
  void setConfigSelectedBikeIndex(int val) {
    configSelectedBikeIndex = val;
    notifyListeners();
  }

  int get getConfigSelectedBikeIndex => configSelectedBikeIndex;

  int configSelectedBikeBrand;
  void setConfigSelectedBikeBrand(int val) {
    configSelectedBikeBrand = val;
    notifyListeners();
  }

  int get getConfigSelectedBikeBrand => configSelectedBikeBrand;

  int configSelectedModelId;
  void setConfigSelectedModelId(int val) {
    configSelectedModelId = val;
    notifyListeners();
  }

  int get getConfigSelectedModelId => configSelectedModelId;


}
