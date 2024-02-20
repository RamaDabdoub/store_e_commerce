class RememberMe {
  String? username;
  String? password;
  bool? rememberme;

  RememberMe({this.username, this.password, this.rememberme});

  RememberMe.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    rememberme = json['rememberme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['rememberme'] = this.rememberme;
    return data;
  }
}
