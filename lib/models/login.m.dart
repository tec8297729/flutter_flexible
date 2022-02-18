/// 用户登录接口返回类型
class LoginMobile {
  int code;
  String msg;
  LoginMobileData data;
  String type;

  LoginMobile({this.code, this.msg, this.data, this.type});

  LoginMobile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null
        ? new LoginMobileData.fromJson(json['data'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class LoginMobileData {
  String authorization;
  int userId;
  String mobile;
  String nickname;
  String avatar;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization'] = this.authorization;
    data['userId'] = this.userId;
    data['mobile'] = this.mobile;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    return data;
  }
}
