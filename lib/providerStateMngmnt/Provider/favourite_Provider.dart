import 'package:flutter/foundation.dart';

class Favourite_Provider with ChangeNotifier {

  List<int> _selected_item = [];

  List<int> get selected_item => _selected_item;

  void addIndex (int value){
    _selected_item.add(value);
    notifyListeners();
  }

  void removeIndex (int value){
    _selected_item.remove(value);
    notifyListeners();
  }
}