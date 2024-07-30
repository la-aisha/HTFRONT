class LoginRequest {
  final String username;
  final String password;
  final String clientId;
  final String grantType;

  LoginRequest({
    required this.username,
    required this.password,
    required this.clientId,
    required this.grantType,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'client_id': clientId,
      'grant_type': grantType,
    };
  }

   /* Map<String, String> toMap() {
    return {
      'username': username,
      'password': password,
      'grant_type': 'password',
      'client_id': 'your_client_id', // Add other required fields here
    };
  } */

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      username: json['username'],
      password: json['password'],
      clientId: json['client_id'],
      grantType: json['grant_type'],
    );
  }
}
