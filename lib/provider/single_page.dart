import 'package:flutter/material.dart';

class SinglePage with ChangeNotifier {
  var singleProduct;
  void addData(selectedData) {
    // singleProduct.clear();
    print("selected$selectedData");
    singleProduct = selectedData;
    notifyListeners();
  }
}
