import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../pages/login.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.width / 2),
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  Constants.APP_DESCRIPTION,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Login.routeName);
                },//_showLoginSheet(context),
                child: Text(
                  Constants.START,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
