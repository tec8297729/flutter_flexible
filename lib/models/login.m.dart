/// 用户登录接口返回类型
class LoginMobile {
  int? code;
  String? msg;
  LoginMobileData? data;
  String? type;

  LoginMobile({this.code, this.msg, this.data, this.type});

  LoginMobile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? LoginMobileData.fromJson(json['data']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class LoginMobileData {
  String? authorization;
  int? userId;
  String? mobile;
  String? nickname;
  String? avatar;

  LoginMobileData(
      {this.authorization,
      this.userId,
      this.mobile,
      this.nickname,
      this.avatar});

  LoginMobileData.fromJson(Map<String, dynamic> json) {
    authorization = json['authorization'];
    userId = json['userId'];
    mobile = json['mobile'];
    nickname = json['nickname'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorization'] = authorization;
    data['userId'] = userId;
    data['mobile'] = mobile;
    data['nickname'] = nickname;
    data['avatar'] = avatar;
    return data;
  }
}
