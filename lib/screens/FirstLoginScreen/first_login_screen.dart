import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/models/UserApp.dart';
import 'package:bulk_n_burn/providers/firebase_providers.dart';
import 'package:bulk_n_burn/screens/MainScreen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:bulk_n_burn/providers/authentication_provider.dart';
import 'package:gsform/gs_form/core/form_style.dart';
import 'package:gsform/gs_form/widget/field.dart';
import 'package:gsform/gs_form/widget/form.dart';

class FirstLoginScreen extends ConsumerStatefulWidget {
  const FirstLoginScreen({super.key});
  static const String id = "first-login-screen";
  @override
  ConsumerState createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends ConsumerState<FirstLoginScreen> {
  //final userName = ref.read(firebaseAuthProvider).currentUser;

  String fullname = "";
  String gender = "";
  String height = "";
  String age = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
          height: MediaQuery.of(context).size.height,
          color: kBackgroundColor,
          child: ListView(
            children: [
              Text(
                'Bulk & Burn',
                style: kHeadlineTextStyle,
              ),
              Text(
                textAlign: TextAlign.center,
                'Let`s get to know each other...',
                style: kNormalTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20 * 4),
                onChanged: (val) {
                  fullname = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: kConsInputDec.copyWith(
                  hintText: 'Full name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20 * 4),
                onChanged: (val) {
                  gender = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: kConsInputDec.copyWith(
                  hintText: 'Gender',
                  prefixIcon: Icon(Icons.circle),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20 * 4),
                onChanged: (val) {
                  height = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: kConsInputDec.copyWith(
                  hintText: 'Height (cm)',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (val) {
                  age = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: kConsInputDec.copyWith(
                  hintText: 'Age',
                  prefixIcon: Icon(Icons.lock_clock),
                ),
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20 * 4),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (fullname != "" &&
                      gender != "" &&
                      height != "" &&
                      age != "") {
                    String? email =
                        ref.read(firebaseAuthProvider).currentUser?.email;
                    String? uid =
                        ref.read(firebaseAuthProvider).currentUser?.uid;
                    /*
                    UserApp user = UserApp(
                        full_name: fullname,
                        email: email!,
                        sex: gender,
                        height: height,
                        age: age);
                    */
                    ref
                        .read(firebaseFirestoreProvider)
                        .collection('Users')
                        .doc(uid)
                        .set({
                      'email': email,
                      'full_name': fullname,
                      'gender': gender,
                      'height': height,
                      'age': age,
                    });
                    //TODO: validate fields
                    Navigator.pushReplacementNamed(context, MainScreen.id);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please fill in all fields!'),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.purple,
                ),
                child: const Text(
                  "Save!",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
