class loginModel {
  int? statusCode;
  bool? status;
  String? message;
  Data? data;

  loginModel({this.statusCode, this.status, this.message, this.data});

  loginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? bearerToken;
  String? userName;
  String? roleName;

  Data({this.bearerToken, this.userName, this.roleName});

  Data.fromJson(Map<String, dynamic> json) {
    bearerToken = json['bearerToken'];
    userName = json['userName'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bearerToken'] = this.bearerToken;
    data['userName'] = this.userName;
    data['roleName'] = this.roleName;
    return data;
  }
}
