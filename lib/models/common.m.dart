class NewVersionRes {
  String? code;
  String? message;
  NewVersionData? data;

  NewVersionRes({this.code, this.message, this.data});

  NewVersionRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? NewVersionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NewVersionData {
  String? version;
  List<String>? info;

  NewVersionData({this.version, this.info});

  NewVersionData.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    info = json['info'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['info'] = info;
    return data;
  }
}
