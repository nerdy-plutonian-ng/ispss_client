import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/my_prefs.dart';
import '../utils/constants.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String _name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUp();
  }

  void  setUp() async {
    final prefs = await SharedPreferences.getInstance();
    String nam = prefs.getString(Constants.NAME) ?? '';
    print('ispss $nam');
    setState(() {
      _name = nam;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(Constants.WELCOME, style: TextStyle(color: Theme.of(context).accentColor),),
      subtitle: Text(_name),
    ),);
  }
}
