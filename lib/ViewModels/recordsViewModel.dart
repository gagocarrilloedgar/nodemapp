import 'package:flutter/cupertino.dart';
import 'package:nodemappweb/Models/records.dart';

class RecordsViewModel extends ChangeNotifier {
  
  List<RecordsView> records;


  void setRecords(val) {
    records = val;
    notifyListeners();
  }
  
}
