import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
    static late SharedPreferences  prefs;
    int() async {
      prefs =  await SharedPreferences.getInstance();
    }

}