import 'package:flutter/material.dart';
import '../sub_pages/bank_account.dart';
import '../sub_pages/mobile_money.dart';
import '../utils/constants.dart';

class FundsInfo extends StatefulWidget {
  @override
  _FundsInfoState createState() => _FundsInfoState();
}

class _FundsInfoState extends State<FundsInfo> {

  Widget medium = Container();

  void getLayout(String chosenMedium){
    if(chosenMedium == Constants.MOBILE_MONEY){
      setState(() {
        medium = MobileMoney();
      });

    } else if(chosenMedium == Constants.BANK_ACCOUNT){
      setState(() {
        medium = BankAccount();
      });

    } else {
      setState(() {
        medium = Container();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select funds medium',
                ),
                items: <String>[Constants.MOBILE_MONEY,Constants.BANK_ACCOUNT].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (chosenMedium) {
                  getLayout(chosenMedium);
                },
              )
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: medium,
          ),
        ],
      ),
    );
  }
}
