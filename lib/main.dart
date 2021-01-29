import 'package:flutter/material.dart';

import 'utils/constants.dart';
import 'pages/landing.dart';
import 'pages/login.dart';
import 'pages/code_verification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.APP_NAME,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.orange
      ),
      darkTheme: ThemeData.dark(),
      home: Landing(),
      routes: {
        Login.routeName : (context) => Login(),
        CodeVerification.routeName : (context) => CodeVerification(),
      },
    );
  }
}