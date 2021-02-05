
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../pages/login.dart';
import '../pages/home.dart';

class Landing extends StatelessWidget {

  Future<double> getMMC() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return ((prefs.getDouble(Constants.MMC)) ?? -1);
  }

  void start(BuildContext context) async {
    double mmc = await getMMC();
    if(mmc < 0){
      Navigator.of(context).pushNamed(Login.routeName);
    } else {
      Navigator.of(context).pushNamed(Home.routeName);
    }
  }

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
                  start(context);
                },
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
