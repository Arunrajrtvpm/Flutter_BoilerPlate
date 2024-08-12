//MARK: Modify the LoginRequest model based on the requirements.
class LoginRequest {
  late Login login;

  LoginRequest({required this.login});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login.toJson();
    return data;
  }
}

class Login {
  late String email;
  late String password;
  LoginAttributes? objectAttributes;

  Login({required this.email, required this.password, this.objectAttributes});

  Login.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class LoginAttributes {
  String? version;
  String? uptime;

  LoginAttributes({this.version, this.uptime});

  LoginAttributes.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    uptime = json['uptime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['uptime'] = uptime;
    return data;
  }
}
