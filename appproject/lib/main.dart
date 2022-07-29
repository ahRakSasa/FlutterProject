import 'package:appproject/HomePage/constats/color.dart';
import 'package:appproject/HomePage/constats/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appproject/login_Signup/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      theme: ThemeData(
          primarySwatch: MyColors.navy,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.amber,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.amber,
              elevation: .2,
              titleTextStyle: TextStyle(fontFamily: Bold, color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white))),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: MyColors.navy,
          scaffoldBackgroundColor: const Color(0xfffcfcfc),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: .2,
              titleTextStyle: TextStyle(fontFamily: Bold, color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white))),
      home: LoginScreen(),
    );
  }
}
