import 'package:shared_preferences/shared_preferences.dart';


class LocalStoarageServices {
  //Optinally If you have to Add your onw value 
  // final String _value = "@project_theme";

  //set data into shared preferences like this
  Future<void> setvalue(String name,dynamic userEnterValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, userEnterValue);
  }

//get value from shared preferences
  Future<String> getValue(dynamic userEnterValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic userEnterValue;
    userEnterValue = pref.getString(userEnterValue) ?? null;
    return userEnterValue;
  }
} 