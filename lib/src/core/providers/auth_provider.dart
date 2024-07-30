import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/requests/login_request.dart';
import 'package:hizboufront/src/core/models/response/login_response.dart';
import 'package:hizboufront/src/core/services/auth_service.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';


class AuthProvider extends ChangeNotifier {
  CommonMethods commonMethods = CommonMethods();

  LoginResponse loginResponse = LoginResponse(accessToken: '', expiresIn: 0, refreshExpiresIn: 0, refreshToken: '', tokenType: '', notBeforePolicy: 0, sessionState: '', scope: '') ;

  static String matricule = "";
  static String role = "";
  static int id = 0;

  // Getter methods
  String get getMatrivule => matricule;
  String get getRole => role;
  int get getId => id;

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
 Future<void> loginProvider(LoginRequest signInRequest, BuildContext context) async {
    try {
      final response = await AuthService.loginService(signInRequest, context);
      if (response != null && response.accessToken.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        notifyListeners();
      } else {
        print('Login failed: No access token');
        throw Exception('Fail to log user');
      }
    } catch (e) {
      print('Exception caught in loginProvider: $e');
      throw Exception('Fail API number: $e');
    }
  }

  Future<void> getMemberinfo(
       String token ,BuildContext context) async {
    try {
      final response = await AuthService.getMemberDetails(token, context);
      if (response != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        notifyListeners();
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
