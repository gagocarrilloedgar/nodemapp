import 'package:flutter/cupertino.dart';

class QrProvider extends ChangeNotifier {
  String qrResult;

  void setQR(val) {
    qrResult = val;
    notifyListeners();
  }

  String get getQR => qrResult;
}
