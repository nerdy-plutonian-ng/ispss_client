import 'package:flutter/material.dart';
import 'package:ispss_client/utils/constants.dart';

class CodeVerification extends StatefulWidget {
  static const routeName = '/codeVerification';
  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  @override
  Widget build(BuildContext context) {
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
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              child: TextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.number,

                              ),
                          width: 10,),
                          Container(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                            ),
                            width: 10,),
                          Container(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                            ),
                            width: 10,),
                          Container(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                            ),
                            width: 10,),
                        ],
                      ),
                      ),
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
