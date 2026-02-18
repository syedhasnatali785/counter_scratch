import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedList = [];
  List<int> get selectedList =>  _selectedList;
void addItem(int value){
  _selectedList.add(value);
  notifyListeners();
}
void removeItem(int value){
  _selectedList.remove(value);
  notifyListeners();
}
}