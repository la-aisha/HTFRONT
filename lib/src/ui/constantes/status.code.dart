// API Status Codes
class StatusCode {
  // HTTP
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalSeverError = 500;
  static const int gatewayTimeout = 504;

  // Custom API
  static const int defaultCode = -1;
  static const int motDePasseExpire = 590;

  // Dio errors
  static const int osError = 101;
}
