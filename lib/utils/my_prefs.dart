import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class MyPrefs {
  SharedPreferences _prefs;

  void setup() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setUserName(String name) async{
    _prefs.setString(Constants.NAME, name);
  }

  Future<String> getUserName() async{
    return _prefs.getString(Constants.NAME);
  }

  void setPhone(String phone) async{
    _prefs.setString(Constants.PHONE, phone);
  }

  Future<String> getPhone() async{
    return _prefs.getString(Constants.PHONE);
  }

  void setEmail(String email) async{
    _prefs.setString(Constants.EMAIL, email);
  }

  Future<String> getEmail() async{
    return _prefs.getString(Constants.EMAIL);
  }

  void setResidence(String residence) async{
    _prefs.setString(Constants.RESIDENCE, residence);
  }

  Future<String> getResidence() async{
    return _prefs.getString(Constants.RESIDENCE);
  }

  void setUserID(String userID) async{
    _prefs.setString(Constants.USER_ID, userID);
  }

  Future<String> getUserID() async{
    return _prefs.getString(Constants.USER_ID);
  }

  void setMMC(double mmc) async{
    _prefs.setDouble(Constants.MMC, mmc);
  }

  Future<double> getMMC(String name) async{
    return _prefs.getDouble(Constants.MMC);
  }
}
