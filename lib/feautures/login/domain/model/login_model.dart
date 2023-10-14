import 'login_model_response.dart';

class LoginModel {
  List<LoginModelResponse>? results;

  LoginModel({this.results});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <LoginModelResponse>[];
      json['results'].forEach((v) {
        results!.add(LoginModelResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
