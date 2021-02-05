import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'package:intl/intl.dart';

class NextOfKin extends StatefulWidget {
  @override
  _NextOfKinState createState() => _NextOfKinState();
}

class _NextOfKinState extends State<NextOfKin> {

  TextEditingController firstNameTC = TextEditingController();
  TextEditingController lastNameTC = TextEditingController();
  TextEditingController dateOfBirthTC = TextEditingController();
  TextEditingController phoneTC = TextEditingController();

  DateTime dateOfBirth = DateTime.now();
  String dateOfBirthStr = 'Card expiry';

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
        dateOfBirth = newDate;
        dateOfBirthTC.text = DateFormat.yMMMd().format(dateOfBirth);
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
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: firstNameTC,
              decoration: InputDecoration(
                labelText: Constants.FIRST_NAME,
                hintText: Constants.FIRST_NAME,
                suffixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: lastNameTC,
              decoration: InputDecoration(
                labelText: Constants.LAST_NAME,
                hintText: Constants.LAST_NAME,
                suffixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              controller: dateOfBirthTC,
              decoration: InputDecoration(
                labelText: Constants.DATE_OF_BIRTH,
                hintText: Constants.DATE_OF_BIRTH,
                suffixIcon: IconButton(icon: Icon(Icons.date_range), onPressed: _selectDate,),
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneTC,
              decoration: InputDecoration(
                labelText: Constants.PHONE,
                hintText: Constants.PHONE,
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                errorText: null,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select gender',
                ),
                items: <String>['Male', 'Female', 'Other',].map((String value) {
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
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select relationship',
                ),
                items: <String>['Sibling', 'Friend', 'Parent','Spouse','Child'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
          ),
        ],
      ),
    );
  }
}
