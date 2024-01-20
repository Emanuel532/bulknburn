import 'package:bulk_n_burn/models/FoodDish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodController extends ChangeNotifier {
  FoodDish fd = dishList[0];

  void changeFood(int newIndex) {
    fd = dishList[newIndex];
    notifyListeners();
  }

  get getName {
    return fd.name;
  }

  get getImage {
    return NetworkImage(fd.imageLink);
  }

  get getCalories {
    return fd.calories;
  }
}

final foodController = ChangeNotifierProvider<FoodController>((ref) {
  return FoodController();
});
