import 'package:flutter/material.dart';
import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/screens/NewAccountScreen/sign_up_form_widget.dart';

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({super.key});

  static const String id = 'new-account-screen';

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
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Bulk & Burn',
                style: kHeadlineTextStyle,
              ),
              Text(
                'Sign Up',
                style: kHeadlineTextStyle.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: 15,
              ),
              SignUpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
