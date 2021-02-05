import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/constants.dart';

class NationalId extends StatefulWidget {
  @override
  _NationalIdState createState() => _NationalIdState();
}

class _NationalIdState extends State<NationalId> {

  TextEditingController nameOnCardTC = TextEditingController();
  TextEditingController idNumberTC = TextEditingController();
  TextEditingController cardExpiryTC = TextEditingController();

  DateTime expiry = DateTime.now();
  String expiryStr = 'Card expiry';

  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime.now(),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        expiry = newDate;
        cardExpiryTC.text = DateFormat.yMMMd().format(expiry);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select card type',
                ),
                items: <String>["Voter's ID", "Driver's license", 'Passport', 'Ghana card'].map((String value) {
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
              keyboardType: TextInputType.name,
              controller: idNumberTC,
              decoration: InputDecoration(
                labelText: Constants.ID_NUMBER,
                hintText: Constants.ID_NUMBER,
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: nameOnCardTC,
              decoration: InputDecoration(
                labelText: Constants.NAME_ON_CARD,
                hintText: Constants.NAME_ON_CARD,
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: cardExpiryTC,
              decoration: InputDecoration(
                labelText: Constants.CARD_EXPIRY,
                hintText: Constants.CARD_EXPIRY,
                suffixIcon: IconButton(icon: Icon(Icons.date_range), onPressed: _selectDate,),
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),

        ],
      ),);
  }
}
