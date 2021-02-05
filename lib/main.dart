import 'package:flutter/material.dart';
import 'package:ispss_client/pages/pay_member.dart';

import 'utils/constants.dart';
import 'pages/landing.dart';
import 'pages/login.dart';
import 'pages/code_verification.dart';
import 'pages/home.dart';
import 'pages/add_member.dart';

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
        Home.routeName : (context) => Home(),
        AddMember.routeName : (context) => AddMember(),
        PayMember.routeName : (context) => PayMember(),
      },
    );
  }
}