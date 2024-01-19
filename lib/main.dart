import 'package:bulk_n_burn/constants.dart';
import 'package:bulk_n_burn/providers/firebase_providers.dart';
import 'package:bulk_n_burn/screens/FirstLoginScreen/first_login_screen.dart';
import 'package:bulk_n_burn/screens/LoginScreen/login_account_screen.dart';
import 'package:bulk_n_burn/screens/MainScreen/main_screen.dart';
import 'package:bulk_n_burn/screens/UserProfileScreen/user_profile_screen.dart';
import 'package:bulk_n_burn/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bulk_n_burn/screens/NewAccountScreen/new_account_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  //bool new_user = true;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Bulk n Burn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBackgroundColor),
        useMaterial3: true,
      ),
      initialRoute: (ref.read(firebaseAuthProvider).currentUser != null)
          ? MainScreen.id
          : LoadingScreen.id,
      routes: {
        LoadingScreen.id: (ctx) => LoadingScreen(),
        FirstLoginScreen.id: (ctx) => FirstLoginScreen(),
        NewAccountScreen.id: (ctx) => NewAccountScreen(),
        LoginScreen.id: (ctx) => LoginScreen(),
        MainScreen.id: (ctx) => MainScreen(),
        UserProfileScreen.id: (ctx) => UserProfileScreen(),
      },
    );
  }
}
