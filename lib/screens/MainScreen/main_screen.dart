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

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});
  static const String id = "main-screen";
  @override
  ConsumerState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  //final userName = ref.read(firebaseAuthProvider).currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  "Bulk & Burn",
                  style: kHeadlineTextStyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircleCaloriesDisplay(),
              SizedBox(
                height: 30,
              ),
              AddActivityCaloriesWidget(),
              RoundIconButtonWidget(
                  onPressed: () {},
                  icon: Icons.calendar_month,
                  iconColor: Colors.blueAccent),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundIconButtonWidget(
                      onPressed: () {},
                      icon: Icons.local_fire_department,
                      iconColor: Colors.red),
                  RoundIconButtonWidget(
                      onPressed: () {},
                      icon: Icons.fastfood,
                      iconColor: Colors.orangeAccent),
                ],
              )
              /*ElevatedButton(
                onPressed: () {
                  print(ref.read(firebaseAuthProvider).currentUser);
                },
                child: Text('c'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).logout();
                },
                child: Text('disc'),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
