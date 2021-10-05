import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool switchTheme = false;

  changeTheme() {
    switchTheme = !switchTheme;
    notifyListeners();
  }
}
