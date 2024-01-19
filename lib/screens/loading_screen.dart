import 'package:bulk_n_burn/screens/LoginScreen/login_account_screen.dart';
import 'package:bulk_n_burn/screens/NewAccountScreen/new_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/widgets/CustomElevatedButton.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoadingScreen extends StatelessWidget {
  static const String id = 'loading-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: kBackgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Bulk & Burn',
                textAlign: TextAlign.center,
                style: kHeadlineTextStyle,
              ),
              Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: kHeadlineTextStyle.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                text: "Login",
                color: Colors.purple,
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              SizedBox(
                height: 25,
              ),
              CustomElevatedButton(
                text: "New Account",
                color: Colors.purple,
                onPress: () {
                  Navigator.pushNamed(context, NewAccountScreen.id);
                },
              ),
              SizedBox(
                height: 25,
              ), //todo: google log in option
              SignInButton(
                Buttons.googleDark,
                onPressed: () {},
                text: 'Sign in Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
