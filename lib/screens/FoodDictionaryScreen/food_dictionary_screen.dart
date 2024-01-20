import 'package:bulk_n_burn/providers/food_selected_provider.dart';
import 'package:bulk_n_burn/screens/FoodDictionaryScreen/quick_food_select_widget.dart';
import 'package:bulk_n_burn/screens/MainScreen/add_activity_calories_widget.dart';
import 'package:bulk_n_burn/widgets/RoundIconButtonWidget.dart';
import 'package:bulk_n_burn/widgets/app_drawer_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/providers/firebase_providers.dart';
import 'package:bulk_n_burn/screens/FirstLoginScreen/first_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bulk_n_burn/providers/authentication_provider.dart';
import 'package:bulk_n_burn/widgets/MainAppBar.dart';
import 'package:bulk_n_burn/screens/MainScreen/circle_calories_display_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final foodListener = ref.watch(foodController);
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: MainAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
          height: MediaQuery.of(context).size.height,
          color: kBackgroundColor,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Food🍕",
                  style: kHeadlineTextStyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              QuickFoodSelectWidget(),
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
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        "${foodListener.getCalories} calories",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //todo:add to counter function
              OrangeSquareButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrangeSquareButton extends StatelessWidget {
  const OrangeSquareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
