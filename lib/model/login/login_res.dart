class LoginRes {
  bool? status;
  String? message;
  Data? data;

  LoginRes({this.status, this.message, this.data});

  LoginRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? id;
  String? fullName;
  String? username;
  String? email;
  Null? phone;
  Null? phoneCountry;
  String? country;
  Null? avatar;

  User(
      {this.id,
      this.fullName,
      this.username,
      this.email,
      this.phone,
      this.phoneCountry,
      this.country,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    phoneCountry = json['phone_country'];
    country = json['country'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_country'] = phoneCountry;
    data['country'] = country;
    data['avatar'] = avatar;
    return data;
  }
}
