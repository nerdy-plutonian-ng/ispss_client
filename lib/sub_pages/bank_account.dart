import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BankAccount extends StatefulWidget {
  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {

  TextEditingController bankAccountNumberTC = TextEditingController();
  TextEditingController bankAccountNameTC = TextEditingController();
  TextEditingController bankNameTC = TextEditingController();
  TextEditingController bankBranchTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: bankAccountNumberTC,
            decoration: InputDecoration(
              labelText: Constants.BANK_ACCOUNT_NUMBER,
              hintText: Constants.BANK_ACCOUNT_NUMBER,
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: bankAccountNameTC,
            decoration: InputDecoration(
              labelText: Constants.BANK_ACCOUNT_NAME,
              hintText: Constants.BANK_ACCOUNT_NAME,
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: bankNameTC,
            decoration: InputDecoration(
              labelText: Constants.BANK_NAME,
              hintText: Constants.BANK_NAME,
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: bankBranchTC,
            decoration: InputDecoration(
              labelText: Constants.BANK_BRANCH,
              hintText: Constants.BANK_BRANCH,
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Select account type',
              ),
              items: <String>["Savings", "Current",].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
        ),
      ],
    );
  }
}
