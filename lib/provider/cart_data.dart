import 'package:app/model/api_model.dart';
import 'package:flutter/material.dart';

class CartDataProvider with ChangeNotifier {
  List<ApiModel> cartData = [];
  void addToCart(ApiModel data) {
    if (cartData.isEmpty) {
      data.setQuantity(1);
      cartData.add(data);
      notifyListeners();
    } else {
      bool itemExists = false;
      for (int i = 0; i < cartData.length; i++) {
        if (data.title == cartData[i].title) {
          cartData[i].qnt = (cartData[i].qnt ?? 0) + 1;
          itemExists = true;
          break;
        }
      }
      if (!itemExists) {
        data.setQuantity(1);
        cartData.add(data);
      }
      notifyListeners();
    }
  }

  void delete(String data) {
    for (int i = 0; i < cartData.length; i++) {
      if (cartData[i].title == data) {
        print("hello");
        cartData.remove(cartData[i]);
        notifyListeners();
      }
    }
  }
}
