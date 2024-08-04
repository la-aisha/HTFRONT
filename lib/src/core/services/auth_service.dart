import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/configs/config.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/response/member_response.dart';
import 'package:hizboufront/src/core/models/requests/login_request.dart';
import 'package:hizboufront/src/core/models/response/login_response.dart';
import 'package:dio/dio.dart';

class AuthService {
  //static var client = http.Client();
  // CommonMethods methods = CommonMethods();
  static Future<LoginResponse?> loginService(
      LoginRequest model, BuildContext context) async {
    try {
      var dio = Dio();
      var url = Config.apiUrlKeycloack + Config.authLoginApi;
      var body = model
          .toJson()
          .entries
          .map((e) =>
              '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
          .join('&');

      print('URL: $url');
      print('Body: $body');

      var response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );

      print('Response status token: ${response.statusCode}');
      print('Response body token : ${response.data}');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        LoginResponse loginResponse = LoginResponse.fromJson(jsonResponse);
        print('Login successful: $loginResponse');
        return loginResponse;
      } else {
        print('Login failed with status: ${response.statusCode}');
        CommonMethods commonMethods = CommonMethods();
        commonMethods.showAlertDialog(
            context, 'Error ', "Veillew essayer plustard");
        /* showAlertDialog(context, 'Erreur de connexion',
            'Impossible de se connecter. Veuillez réessayer.'); */
        return null;
      }
    } catch (e) {
      print('------- ERROR LOGIN SERVICE --------');
      print('Error: $e');
      CommonMethods commonMethods = CommonMethods();
      commonMethods.showAlertDialog(
          context, 'Error ', "Veillew essayer plustard");
      throw Exception('Échec de l\'API Auth: $e');
    }
  }

  static Future<MemberResponse?> getMemberinfoService(
      String token, BuildContext context) async {
    try {
      var dio = Dio();
      var url = Config.apiUrlMs + Config.getMemberInfo;

      print('Fetching from URL: $url');

      var response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': Headers.jsonContentType,
          },
        ),
      );
      print(response.data.toString());

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        MemberResponse memberResponse = MemberResponse.fromJson(jsonResponse);
        print('Member details fetched successfully: $memberResponse');
        return memberResponse;
      } else {
        print(
            'Failed to fetch member details with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching member details: $e');
      throw Exception('Error fetching member details: $e');
    }
  }

  static Future logOutService(String token, BuildContext context) async {
    try {
      var dio = Dio();
      var url = Config.apiUrlKeycloack + Config.logOut;

      print('Fetching from URL: $url');

      var response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': Headers.jsonContentType,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Member log out   successfully: ');
        //return memberResponse;
      } else {
        print('Failed to logout user: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error lougout   : $e');
      throw Exception('Error logging out member : $e');
    }
  }
}
