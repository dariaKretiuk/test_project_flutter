import 'package:flutter/material.dart';

class BottomBarUtility with ChangeNotifier {
  bool _isShowBar = true;

  bool get isShowBar => _isShowBar;

  void hideBar() {
    _isShowBar = false;
    notifyListeners();
  }

  void showBar() {
    _isShowBar = true;
    notifyListeners();
  }
}
