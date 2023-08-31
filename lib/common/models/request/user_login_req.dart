/// 用户登录
class UserLoginReq {
  String? username;
  String? password;

  UserLoginReq({
    this.username,
    this.password,
  });

  factory UserLoginReq.fromJson(Map<String, dynamic> json) {
    return UserLoginReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
