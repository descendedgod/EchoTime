import 'package:flutter/material.dart';
import '../models/city.dart';
import '../utils/city_list.dart';

class CityProvider extends ChangeNotifier {
  City _selectedCity = cities[0];

  City get selectedCity => _selectedCity;

  void selectCity(City city) {
    _selectedCity = city;
    notifyListeners();
  }
}
