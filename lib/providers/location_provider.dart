import 'package:flutter/cupertino.dart';

class LocationProvider extends ChangeNotifier {
  List<String> _governorates = [];
  List<String> _cities = [];
  String _initialGov = 'القاهرة';
  String _initialCity = 'مايو 15';
  List<String> get governorates => _governorates;
  List<String> get cities => _cities;
  String get initialGov => _initialGov ;
  String get initialCity => _initialCity;
  set governorates(List<String> value) {
    _governorates = value;
    notifyListeners();
  }

  set cities(List<String> value) {
    _cities = value;
    notifyListeners();
  }

  set initialGov(String value) {
    _initialGov = value;
    notifyListeners();
  }

  set initialCity(String value) {
    _initialCity = value;
    notifyListeners();
  }
}
