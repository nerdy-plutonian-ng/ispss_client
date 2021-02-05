import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SchemeInfo extends StatefulWidget {
  @override
  _SchemeInfoState createState() => _SchemeInfoState();
}

class _SchemeInfoState extends State<SchemeInfo> {

  TextEditingController pprTC = TextEditingController();
  TextEditingController maxSavingsTC = TextEditingController();

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
                  hintText: 'Select scheme to save with',
                ),
                items: <String>["Axis Pension", "Metropolitan", 'Emterprise Ltd',].map((String value) {
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
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              controller: pprTC,
              decoration: InputDecoration(
                labelText: Constants.PERCENTAGE_ON_PAYMENTS,
                hintText: Constants.PERCENTAGE_ON_PAYMENTS,
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              controller: maxSavingsTC,
              decoration: InputDecoration(
                labelText: Constants.MAX_MONTHLY_CONTRIBUTION,
                hintText: Constants.MAX_MONTHLY_CONTRIBUTION,
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
