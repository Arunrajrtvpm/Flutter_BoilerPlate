
//Modify the LoginResponse based on your project.
class LoginResponse {
  Status? status;
  Token? token;
  AuthorizedUser? authorizedUser;

  LoginResponse({this.status, this.token, this.authorizedUser});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['st']) : null;
    authorizedUser = json['authorizedUser'] != null
        ? AuthorizedUser.fromJson(json['authorizedUser'])
        : null;
  }
}

class Status {
  String? text;
  String? errorCode;

  Status({this.text});

  Status.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['errorCode'] = errorCode;
    return data;
  }
}

class Token {}

class AuthorizedUser {
  String? userId;
  String? name;

  AuthorizedUser({this.userId, this.name});

  AuthorizedUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
  }
}
