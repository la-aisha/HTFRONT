import 'dart:convert';

import '../../../../model/user.dart';
import '../shared_helper.dart';

class ConnectedUser extends SharedHelper {
  saveToken(String token) async {
    await SharedHelper.prefs.setString("token", token);
  }

  String? getToken() {
    return SharedHelper.prefs.getString("token");
  }

  saveCurrentUser(dynamic user) async {
    //print('SAVED === ${}');
    await SharedHelper.prefs.setString("user", jsonEncode(user));
  }

  User? getCurrentUser() {
    var user = SharedHelper.prefs.getString("user");
    //print('NOOOOOO ${user}');
    if (user != null) {
      return User.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }

  logOut() {
    SharedHelper.prefs.remove('user');
  }

  isMyFirtsConnec() async {
    await SharedHelper.prefs.setBool("firtsCnnect", true);
  }

  bool? getIsMyFirtsConnec() {
    return SharedHelper.prefs.getBool("firtsCnnect");
  }

  static bool isAdmin() {
    var user = SharedHelper.prefs.getString("user");
    if (user != null) {
      return User.fromJson(jsonDecode(user)).role!.libelle == "ADMIN";
    } else {
      return false;
    }
  }
}
