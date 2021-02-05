import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  TextEditingController firstNameTC = TextEditingController();
  TextEditingController middleNameTC = TextEditingController();
  TextEditingController lastNameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController phoneTC = TextEditingController();
  TextEditingController residenceTC = TextEditingController();
  TextEditingController hometownTC = TextEditingController();
  TextEditingController occupationTC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
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
            controller: middleNameTC,
            decoration: InputDecoration(
              labelText: Constants.MIDDLE_NAME,
              hintText: Constants.MIDDLE_NAME,
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
            keyboardType: TextInputType.emailAddress,
            controller: emailTC,
            decoration: InputDecoration(
              labelText: Constants.EMAIL,
              hintText: Constants.EMAIL,
              suffixIcon: Icon(Icons.email),
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
          child: TextFormField(
            keyboardType: TextInputType.streetAddress,
            controller: residenceTC,
            decoration: InputDecoration(
              labelText: Constants.RESIDENCE,
              hintText: Constants.RESIDENCE,
              suffixIcon: Icon(Icons.house),
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: hometownTC,
            decoration: InputDecoration(
              labelText: Constants.HOMETOWN,
              hintText: Constants.HOMETOWN,
              suffixIcon: Icon(Icons.map),
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: occupationTC,
            decoration: InputDecoration(
              labelText: Constants.OCCUPATION,
              hintText: Constants.OCCUPATION,
              suffixIcon: Icon(Icons.work),
              border: OutlineInputBorder(),
              errorText: null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: occupationTC,
            decoration: InputDecoration(
              labelText: Constants.OCCUPATION,
              hintText: Constants.OCCUPATION,
              suffixIcon: Icon(Icons.work),
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
      ],
    ),);
  }
}
