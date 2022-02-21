class NewVersionData {
  String? code;
  String? message;
  Data? data;

  NewVersionData({this.code, this.message, this.data});

  NewVersionData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? version;
  List<String>? info;

  Data({this.version, this.info});

  Data.fromJson(Map<String, dynamic> json) {
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
