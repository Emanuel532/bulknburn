import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/providers/firebase_providers.dart';
import 'package:bulk_n_burn/providers/userApp_provider.dart';
import 'package:bulk_n_burn/widgets/MainAppBar.dart';
import 'package:bulk_n_burn/widgets/RoundIconButtonWidget.dart';
import 'package:bulk_n_burn/widgets/app_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});
  static const id = 'user-profile-screen';

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  final kTextInfoStyle = TextStyle(fontSize: 30, color: Colors.white);
  String age = "";
  String gender = "";
  String email = "";
  String fullname = "";
  String height = "";
  @override
  void initState() {
    // TODO: implement initState
    ref.read(userAppSnapshotProvider).then((snapShot) {
      Map<dynamic, dynamic>? values = snapShot.data();
      if (values != null) {
        age = values['age'];
        gender = values['gender'];
        email = values['email'];
        fullname = values['full_name'];
        height = values['height'];
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: MainAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          color: kBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundIconButtonWidget(
                        onPressed: () {},
                        icon: Icons.person,
                        iconColor: Colors.black,
                      ),
                      Text(
                        fullname,
                        style: kTextInfoStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender', style: kTextInfoStyle),
                      Text(gender, style: kTextInfoStyle),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age', style: kTextInfoStyle),
                      Text(age, style: kTextInfoStyle),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //todo: calculate lost/gained calories
                      Text('Calories Gained', style: kTextInfoStyle),
                      Text('...', style: kTextInfoStyle),
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.grey,
                height: 150,
                child: Text(
                  'History',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
