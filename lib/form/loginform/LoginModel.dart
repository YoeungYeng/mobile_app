class LoginModel {
  String? stauts;
  String? token;
  int? id;
  String? email;
  String? password;

  LoginModel({this.stauts, this.token, this.id, this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    stauts = json['stauts'];
    token = json['token'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stauts'] = this.stauts;
    data['token'] = this.token;
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
