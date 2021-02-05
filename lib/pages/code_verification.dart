import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/my_prefs.dart';
import 'package:ispss_client/utils/services.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:ispss_client/utils/constants.dart';
import '../widgets/loader.dart';
import 'home.dart';

class CodeVerification extends StatefulWidget {
  static const routeName = '/codeVerification';

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {

  final TextEditingController _oneController = TextEditingController();
  final TextEditingController _twoController = TextEditingController();
  final TextEditingController _threeController = TextEditingController();
  final TextEditingController _fourController = TextEditingController();

  bool fourthFilled = false;
  String _userId = '';
  String _messageId = '';

  final MyPrefs _myPrefs = MyPrefs();

  void _setUserID(String userID, String messageId){
    setState(() {
      _userId = userID;
      _messageId = messageId;
    });
  }

  void setPersonalInfo(String name, String userId, String residence, String email, String phone, double mmc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.NAME, name);
    prefs.setString(Constants.USER_ID, userId);
    prefs.setString(Constants.RESIDENCE, residence);
    prefs.setString(Constants.EMAIL, email);
    prefs.setString(Constants.PHONE, phone);
    prefs.setDouble(Constants.MMC, mmc);
  }

  String _getTypedCode(){
    return '${_oneController.text}${_twoController.text}${_threeController.text}${_fourController.text}';
  }

  void sendCode(BuildContext context,) async {

    if( await Services.isConnectedToInternet()){
      setState(() {
        fourthFilled = !fourthFilled;
      });
      showModalBottomSheet(
          isDismissible: false,
          context: context,
          builder: (_) {
            return Loader(Constants.VERIFYING_CODE);
          });
      _callVerifyCode();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have no internet connection'), backgroundColor: Colors.redAccent,));
    }
  }

  Future<void> _callVerifyCode() async {
    final String url = '${Constants.VERIFY_CODE_URL}${_getTypedCode()}/$_messageId';
    var response = await http.post(url);

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      //final jresponse = convert.jsonDecode(response.body);
      final jsonResponse = convert.jsonDecode(response.body);
      final body = jsonResponse['body'];
      final personalData = body['personal'];
      final fundSetup = body['fundSetup'];
      int code = jsonResponse['code'];
      print('code = $code');
      if(code == 0){
        print('ispss load success');
        try {
          String firstName = personalData['firstName'];
          String middleName = (personalData['middleName'] as String).isEmpty
              ? ' '
              : ' ${personalData['middleName']} ';
          String lastName = personalData['lastName'];
          String name = '$firstName$middleName$lastName';
          setPersonalInfo(name, _userId, personalData['residence'], personalData['emailAddress'], personalData['phoneNumber'], fundSetup['mmc']);
          print('mmc = ${fundSetup['mmc']}');
          Navigator.of(context).pushNamedAndRemoveUntil(Home.routeName,(r) => false);
        } catch (e){
          print('ispss ${e.toString()}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed')));
        }

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed verifying code')));
      }
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.statusCode}')));
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void _resendCode(){

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final  Map<String, Object>passedData = ModalRoute.of(context).settings.arguments;
    _setUserID(passedData[Constants.USER_ID], passedData[Constants.MESSAGE_ID]);

    final node = FocusScope.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Constants.VERIFY_YOUR_PHONE,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        child: Text(
                          Constants.CODE_VERIFICATION_INSTRUCTION,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _oneController,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    node.nextFocus();
                                  }
                                },
                              ),
                              width: 10,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _twoController,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    node.nextFocus();
                                  }
                                },
                              ),
                              width: 10,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _threeController,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    node.nextFocus();
                                  }
                                },
                              ),
                              width: 10,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _fourController,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    sendCode(context);
                                  }
                                },
                              ),
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                        child: Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisSize : MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.autorenew),
                              label: Text(Constants.RESEND_CODE),
                            ),
                            Countdown(
                              seconds: 60,
                              build: (BuildContext context, double time) =>
                                  Text(time.toStringAsFixed(2)),
                              interval: Duration(seconds: 60),
                              onFinished: () {
                                print('Timer is done!');
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
