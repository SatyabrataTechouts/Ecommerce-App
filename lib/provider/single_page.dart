import 'package:app/model/api_model.dart';
import 'package:flutter/material.dart';

class SinglePage with ChangeNotifier {
  var singleProduct;
  void addData(selectedData) {
    // singleProduct.clear();
    print("selected$selectedData");
    singleProduct = selectedData;
  }
}
