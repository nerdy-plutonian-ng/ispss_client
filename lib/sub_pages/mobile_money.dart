import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MobileMoney extends StatefulWidget {
  @override
  _MobileMoneyState createState() => _MobileMoneyState();
}

class _MobileMoneyState extends State<MobileMoney> {

  TextEditingController mobileMoneyAccountName = TextEditingController();
  TextEditingController mobileMoneyNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Select card type',
              ),
              items: <String>["MTN", "Vodafone", 'AirtelTigo'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: mobileMoneyNumber,
            decoration: InputDecoration(
              labelText: Constants.MOBILE_MONEY_NUMBER,
              hintText: Constants.MOBILE_MONEY_NUMBER,
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: mobileMoneyAccountName,
            decoration: InputDecoration(
              labelText: Constants.MOBILE_MONEY_ACCOUNT_NAME,
              hintText: Constants.MOBILE_MONEY_ACCOUNT_NAME,
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
      ],
    );
  }
}
