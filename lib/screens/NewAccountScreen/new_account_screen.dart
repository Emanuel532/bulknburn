import 'package:flutter/material.dart';
import 'package:bulk_n_burn/constants.dart';

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
        ],
      ),
    );
  }
}
