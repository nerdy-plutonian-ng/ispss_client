import 'dart:convert' as convert;
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ispss_client/pages/code_verification.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants.dart';
import '../widgets/loader.dart';
import '../utils/services.dart';
import '../pages/code_verification.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _errorMessage = '';
  bool _loginNotClicked = true;
  TextEditingController _userIDController = TextEditingController();

  void _login(BuildContext context, String userID) async {

    if( await Services.isConnectedToInternet()){
      setState(() {
        _loginNotClicked = !_loginNotClicked;
      });
      if (!_loginNotClicked) {
        showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (_) {
              return Loader(Constants.LOGGING_IN);
            });
      }
      _callLogin(userID);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have no internet connection'), backgroundColor: Colors.redAccent,));
    }

  }

  Future<void> _callLogin(final String userId) async {
    print(Constants.LOGIN_USER_URL+userId);
    var response = await http.post(Constants.LOGIN_USER_URL+userId);
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      var jsonResponse = convert.jsonDecode(response.body);
      int code = jsonResponse['code'];
      String messageId = jsonResponse['body'];
      if(code == 0){
        Navigator.of(context).pushNamed(CodeVerification.routeName, arguments: {
          Constants.USER_ID : _userIDController.text,
          Constants.MESSAGE_ID : messageId,
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter the code sent to your phone'), backgroundColor: Colors.greenAccent,));

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed logging you in')));
      }
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.statusCode}')));
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.LOGIN),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () => _login(context,_userIDController.text),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/lock.json',
                    height: 200,
                    width: 200,
                  ),
                  TextFormField(
                    controller: _userIDController,
                    autofocus: true,
                    maxLength: 7,
                    maxLengthEnforced: true,
                    enabled: _loginNotClicked,
                    decoration: InputDecoration(
                      labelText: 'User ID',
                      suffix: IconButton(
                        icon: Icon(Icons.login),
                        color: Theme.of(context).accentColor,
                        onPressed: () => _login(context,_userIDController.text),
                      ),
                      helperText: Constants.USER_ID_DESCRIPTION,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Constants.NOT_A_USER,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(Constants.RESEND_CODE),
                      Text(
                        Constants.REGISTER,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
