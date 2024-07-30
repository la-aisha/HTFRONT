import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/requests/login_request.dart';
import 'package:hizboufront/src/core/models/response/login_response.dart';
import 'package:hizboufront/src/core/models/response/member_response.dart';
import 'package:hizboufront/src/core/services/auth_service.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  CommonMethods commonMethods = CommonMethods();
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  LoginResponse loginResponse = LoginResponse(
      accessToken: '',
      expiresIn: 0,
      refreshExpiresIn: 0,
      refreshToken: '',
      tokenType: '',
      notBeforePolicy: 0,
      sessionState: '',
      scope: '');
  static String matricule = "";
  static String role = "";
  static int id = 0;

  // Getter methods
  String get getMatrivule => matricule;
  String get getRole => role;
  int get getId => id;
  String _token = "";
  String get token => _token;

  void checksignin() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  /* save authinfo to shared preferences */
  Future saveTokenInfoToSP(LoginResponse loginresponse) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString("token_info", jsonEncode(loginresponse));
    notifyListeners();
  }

  /* get user infi */
  Future<LoginResponse?> getTokenInfoFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("oken_info") ?? "";
    if (data.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(data);
      LoginResponse result = LoginResponse.fromJson(jsonData);
      print('----- Data from Auth ${result} ----------');

      return LoginResponse.fromJson(jsonData);
    }
    return null;
  }

  /* login provider */
  /* Future loginProvider(LoginRequest signInRequest, BuildContext context) async {
    try {
      final response = await AuthService.loginService(signInRequest, context);
      if (response!.accessToken.isNotEmpty) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home()));
        notifyListeners();
      } else {
        throw Exception('fail to log user');
      }
    } catch (e) {
      throw Exception('fail api number:$e');
    }
  } */
  Future<LoginResponse> loginProvider(
      LoginRequest signInRequest, BuildContext context) async {
    try {
      final response = await AuthService.loginService(signInRequest, context);
      if (response != null && response.accessToken.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        notifyListeners();
        _token = response.accessToken;
        print('------ Token value $token ------');
        saveTokenInfoToSP(response);
        setSignIn();
        return response;
      } else {
        print('Login failed: No access token');
        throw Exception('Fail to log user');
      }
    } catch (e) {
      print('Exception caught in loginProvider: $e');
      throw Exception('Fail API number: $e');
    }
  }

  Future<MemberResponse> getMemberinfoProvider(
      String token, BuildContext context) async {
    try {
      final response = await AuthService.getMemberinfoService(token, context);
      if (response != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        notifyListeners();
        return response;
      } else {
        print('Login failed: No access token');
        throw Exception('Fail to log user');
      }
    } catch (e) {
      print('Exception caught in loginProvider: $e');
      throw Exception('Fail API number: $e');
    }
  }
}
