import 'package:bulk_n_burn/models/DateModel.dart';
import 'package:bulk_n_burn/providers/ConsumedCalories.dart';
import 'package:bulk_n_burn/providers/food_selected_provider.dart';
import 'package:bulk_n_burn/screens/FoodDictionaryScreen/quick_food_select_widget.dart';
import 'package:bulk_n_burn/screens/MainScreen/add_activity_calories_widget.dart';
import 'package:bulk_n_burn/widgets/RoundIconButtonWidget.dart';
import 'package:bulk_n_burn/widgets/app_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/providers/firebase_providers.dart';
import 'package:bulk_n_burn/screens/FirstLoginScreen/first_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bulk_n_burn/providers/authentication_provider.dart';
import 'package:bulk_n_burn/widgets/MainAppBar.dart';
import 'package:bulk_n_burn/screens/MainScreen/circle_calories_display_widget.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class FoodDictionaryScreen extends ConsumerStatefulWidget {
  const FoodDictionaryScreen({super.key});
  static const String id = "food-dictionary-screen";
  @override
  ConsumerState createState() => _FoodDictionaryScreenState();
}

class _FoodDictionaryScreenState extends ConsumerState<FoodDictionaryScreen> {
  //final userName = ref.read(firebaseAuthProvider).currentUser;

  @override
  void initState() {
    super.initState();
  }

  int _currentFoodQuantity = 100;

  @override
  Widget build(BuildContext context) {
    final foodListener = ref.watch(foodController);
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: MainAppBar(titleText: "Food🍕"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
          height: MediaQuery.of(context).size.height,
          color: kBackgroundColor,
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              QuickFoodSelectWidget(),
              //todo: add search bar for diff dishes
              Container(
                //todo: on doubleTap input desired quantity popup
                child: NumberPicker(
                  textStyle: TextStyle(color: Colors.white, fontSize: 30),
                  selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                  axis: Axis.horizontal,
                  value: _currentFoodQuantity,
                  minValue: 10,
                  maxValue: 1000,
                  onChanged: (value) =>
                      setState(() => _currentFoodQuantity = value),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: foodListener.getImage,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        foodListener.getName,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        foodListener.getIsFoodSelected
                            ? "$_currentFoodQuantity grams"
                            : "Choose a meal!",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        foodListener.getIsFoodSelected
                            ? "${(foodListener.getCalories * 0.01 * _currentFoodQuantity).toInt()} calories"
                            : "",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              OrangeSquareButton(
                text: 'Add to counter',
                onPressed: () async {
                  //todo:refactor in a function
                  if (foodListener.getName != "") {
                    //check if there is any dish selected
                    String? uid =
                        ref.read(firebaseAuthProvider).currentUser?.uid;
                    int curentCalories = 0;
                    ref.read(consumedCaloriesController).setCalories(0);
                    await ref
                        .read(firebaseFirestoreProvider)
                        .collection('consumed_food')
                        .doc(uid!)
                        .collection(DateModel.getCurrentDate().toString())
                        .doc('Calories')
                        .get()
                        .then((snapShot) {
                      Map<dynamic, dynamic>? values = snapShot.data();
                      if (values != null) {
                        //checking todays calories
                        curentCalories = values['calories'].toInt();
                        ref
                            .read(consumedCaloriesController)
                            .setCalories(values['calories'].toInt());
                      }
                    });

                    String formattedCurrentDate = DateModel.getCurrentDate();

                    ref
                        .read(firebaseFirestoreProvider)
                        .collection('consumed_food')
                        .doc(uid!)
                        .collection(formattedCurrentDate)
                        .doc(DateTime.now().millisecondsSinceEpoch.toString())
                        .set({
                      'name': foodListener.fd.name,
                      'calories': (foodListener.getCalories *
                              0.01 *
                              _currentFoodQuantity)
                          .toInt(),
                      'grams': _currentFoodQuantity,
                      'time_stamp': DateTime.now().millisecondsSinceEpoch,
                    }, SetOptions(merge: true));
                    ref
                        .read(firebaseFirestoreProvider)
                        .collection('consumed_food')
                        .doc(uid!)
                        .collection(formattedCurrentDate)
                        .doc('Calories')
                        .set({
                      'calories': curentCalories +
                          foodListener.getCalories * 0.01 * _currentFoodQuantity
                    });
                    ref.read(consumedCaloriesController).addCalories(
                        (foodListener.getCalories * 0.01 * _currentFoodQuantity)
                            .toInt());
                    Navigator.pop(context);
                    showSuccesSnackBar(context, foodListener.fd.name, true);
                  } else {
                    showSuccesSnackBar(context, foodListener.fd.name, false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrangeSquareButton extends StatelessWidget {
  const OrangeSquareButton({
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(color: Colors.orange, width: 2),
        ),
        padding: EdgeInsets.all(5),
        child: Text(
          "Add to counter",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

void showSuccesSnackBar(BuildContext context, String foodName, bool succes) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final snackBar = SnackBar(
    content: succes
        ? Text('Your $foodName meal was added succesfully!')
        : Text("Please provide a meal!"),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
