import 'dart:convert';

import 'package:app/model/head_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HeadProvider with ChangeNotifier {
  List<dynamic> product = [];
  Future<void> setProduct() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/head_product.json');
      final newProducts = json.decode(jsonString) as List<dynamic>;
      List<HeadModel> data =
          newProducts.map((e) => HeadModel.fromJson(e)).toList();
      product = data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
