import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CoffeeBox {
  CoffeeBox() {
    initialise();
    _coffees = Hive.box("coffee");
  }

  void initialise() async {
    await Hive.openBox("coffee");
  }

  late Box _coffees;

  DateTime dateOnly(DateTime date) => DateUtils.dateOnly(date);

  int getCoffeeFromDate(DateTime date) {
    String d = dateOnly(date).toIso8601String();
    if (!_coffees.containsKey(d)) {
      _coffees.put(d, 0);
      return 0;
    }
    int c = _coffees.get(d);
    return c;
  }

  void setCoffeeAmount(DateTime date, int amount) {
    String d = dateOnly(date).toIso8601String();
    _coffees.put(d, amount);
  }

  void setToday(int amount) {
    setCoffeeAmount(DateTime.now(), amount);
  }

  int getToday() {
    return getCoffeeFromDate(DateTime.now());
  }
}
