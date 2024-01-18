import 'package:bulk_n_burn/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bulk_n_burn/screens/NewAccountScreen/new_account_screen.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //bool new_user = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bulk n Burn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBackgroundColor),
        useMaterial3: true,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: NewAccountScreen()),
      ),
    );
  }
}
