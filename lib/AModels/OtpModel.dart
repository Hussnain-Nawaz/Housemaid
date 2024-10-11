class OtpModel {
  int? statusCode;
  bool? status;
  String? message;
  Data? data;

  OtpModel({this.statusCode, this.status, this.message, this.data});

  OtpModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? emailVerifiedAt;

  Data(
      {this.name,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.emailVerifiedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}
