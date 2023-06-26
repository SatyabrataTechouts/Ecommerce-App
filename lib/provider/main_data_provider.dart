import 'dart:convert';

import 'package:app/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainDataProvider with ChangeNotifier {
  List<dynamic> products = [];
  List<dynamic> mappedData = [];

  List<dynamic> select = [];
  Future<void> storeData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      products = jsonDecode(response.body);
      // final List<Data> =  products.map((e) => Data(e)).toList();
      final List<ApiModel> data =
          products.map((e) => ApiModel.fromJson(e)).toList();
      mappedData = data;
      notifyListeners();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  void selectedData(String data) {
    select.clear();
    for (int i = 0; i < mappedData.length; i++) {
      print('cat:${mappedData[i]}');
      if (mappedData[i].category == data) {
        ApiModel list = mappedData[i];

        select.add(list);

        notifyListeners();
        // Add break statement if you want to exit the loop after finding a match
      }
    }
  }
}
