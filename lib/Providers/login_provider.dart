import 'package:flutter/cupertino.dart';

import '../class/Tweet.dart';
import '../http_request.dart';

class LoginProvider with ChangeNotifier {

  bool _loggedIn = false;

  LoginProvider();

  bool loggedIn() => _loggedIn;

  void logUser(){
    _loggedIn = true;
    print(_loggedIn);
    notifyListeners();
  }

  void deleteUser(){
    _loggedIn = false;
    print(_loggedIn);
    notifyListeners();
  }


}