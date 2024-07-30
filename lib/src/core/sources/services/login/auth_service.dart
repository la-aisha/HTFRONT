/* import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../local/shared_pref/login_pref/login_shared.dart';
import '../http_helper.dart';

class AuthService extends HttpHelper {
  Future<dynamic> login(String route, dynamic data) async {
    try {
      var res = await http.post(
        Uri.parse(apiUrl + route),
        body: data,
      );
      print(res.body);

      if (res.statusCode == 201 || res.statusCode == 200) {
        ConnectedUser().saveToken(json.decode(res.body)['token']);
        ConnectedUser().saveCurrentUser(json.decode(res.body)['user']);
      }
      return res;
    } catch (e) {
      print(e);
      throw Exception(
          'Une erreur s\'est produite, veuillez réessayer plus tard.');
    }
  }

  Future<dynamic> singUp(String route, dynamic data) async {
    try {
      var res = await http.post(
        Uri.parse(apiUrl + route),
        body: data,
      );

      print(res);
      return res;
    } catch (e) {
      throw Exception(
          'Une erreur s\'est produite, veuillez réessayer plus tard.');
    }
  }
}
 */