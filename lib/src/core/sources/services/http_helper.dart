import 'package:dio/dio.dart';

import '../local/shared_pref/login_pref/login_shared.dart';

class HttpHelper {
  final Dio api = Dio();
  final String apiUrl = 'http://api.book-yoon.softintel.net/public/api/';
  final protocol = "http";

  HttpHelper() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      bool isContainsPath(String path) {
        return options.path.contains(path);
      }

      if (!options.path.contains(protocol)) {
        options.path = apiUrl + options.path;
      }

      if (!isContainsPath("/login") && !isContainsPath("/sing-in")) {
        // GET TOKEN FROM SHARED
        options.headers['Authorization'] =
            'Bearer ${ConnectedUser().getToken()}';
        options.responseType = ResponseType.plain;
        options.contentType = 'application/json';
      }

      return handler.next(options);
    }, onError: (DioError error, handler) async {
      print(error.response?.statusCode);
      if (error.response?.statusCode == 401) {
        /*String refreshtoken = await AuthHive().getRefreshToken();
        if (await refreshToken(refreshtoken)) {
          return handler.resolve(await _retry(error.requestOptions));
        }*/
      }
      return handler.next(error);
    }));
  }

  Future<bool> refreshToken(String refreshToken) async {
    final response = await api
        .post(apiUrl + '/auth/refresh', data: {'refreshToken': refreshToken});
    if (response.statusCode == 201) {
      refreshToken = response.data;
      return true;
    } else {
      //await AuthHive().removeRefreshToken();
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<Response?> handlePostRequest(String route, dynamic data) async {
    try {
      var res = await api.post(
        apiUrl + route,
        data: data,
        options: Options(
            responseType: ResponseType.plain, contentType: 'application/json'),
      );

      print('POST STATUS RESPONSE');
      print(res.statusCode);
      return res;
    } on DioError catch (e) {
      print('POST STATUS ERRORR');
      print(e.response!.statusCode);
      return e.response;
    }
  }

  Future<Response?> handleGetRequest(String route, {dynamic data}) async {
    try {
      var res = await api.get(
        apiUrl + route,
        queryParameters: data,
        options: Options(
            responseType: ResponseType.plain, contentType: 'application/json'),
      );
      return res;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
