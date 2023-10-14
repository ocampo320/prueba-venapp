class LoginModelResponse {
  String? user;
  String? password;

  LoginModelResponse({this.user, this.password});

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['password'] = password;
    return data;
  }
}
