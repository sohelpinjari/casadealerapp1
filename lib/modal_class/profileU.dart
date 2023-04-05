class updateProfile2 {
  String? status;
  Updated? updated;

  updateProfile2({this.status, this.updated});

  updateProfile2.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    updated =
    json['updated'] != null ? new Updated.fromJson(json['updated']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.updated != null) {
      data['updated'] = this.updated!.toJson();
    }
    return data;
  }
}

class Updated {
  String? dId;
  String? fullName;
  String? companyName;
  String? phoneOne;
  String? phoneTwo;
  String? emailId;
  String? address;
  String? password;
  String? confirmPassword;
  String? acIa;
  String? lastLoginTime;
  String? forgotPassKey;
  String? createdTime;

  Updated(
      {this.dId,
        this.fullName,
        this.companyName,
        this.phoneOne,
        this.phoneTwo,
        this.emailId,
        this.address,
        this.password,
        this.confirmPassword,
        this.acIa,
        this.lastLoginTime,
        this.forgotPassKey,
        this.createdTime});

  Updated.fromJson(Map<String, dynamic> json) {
    dId = json['d_id'];
    fullName = json['full_name'];
    companyName = json['company_name'];
    phoneOne = json['phone_one'];
    phoneTwo = json['phone_two'];
    emailId = json['email_id'];
    address = json['address'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    acIa = json['ac_ia'];
    lastLoginTime = json['last_login_time'];
    forgotPassKey = json['forgot_pass_key'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['d_id'] = this.dId;
    data['full_name'] = this.fullName;
    data['company_name'] = this.companyName;
    data['phone_one'] = this.phoneOne;
    data['phone_two'] = this.phoneTwo;
    data['email_id'] = this.emailId;
    data['address'] = this.address;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['ac_ia'] = this.acIa;
    data['last_login_time'] = this.lastLoginTime;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['created_time'] = this.createdTime;
    return data;
  }
}