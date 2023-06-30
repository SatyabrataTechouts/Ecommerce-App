import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProv with ChangeNotifier {
  User? loginUser;
  void setUid(User? user) {
    loginUser = user;
    notifyListeners();
  }
}
