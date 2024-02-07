import 'package:bulk_n_burn/models/FoodDish.dart';
import 'package:bulk_n_burn/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumedCaloriesController extends ChangeNotifier {
  int caloriesToday = 0;

  void setCalories(int newCalories) {
    caloriesToday = newCalories;
    notifyListeners();
  }

  void addCalories(int caloriesAmount) {
    caloriesToday += caloriesAmount;
    notifyListeners();
  }
}

final consumedCaloriesController =
    ChangeNotifierProvider<ConsumedCaloriesController>((ref) {
  return ConsumedCaloriesController();
});
