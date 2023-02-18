// class Userdata {
//   String? status;
//
//   Userdata({this.status});
//
//   Userdata.fromJson(Map<dynamic, dynamic> json) {
//     status = json['status'];
//   }
//
//   Map toJson() {
//     final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
//     data['status'] = this.status;
//     return data;
//   }
// }


class usermodal {
  String? status;
  String? data;
  Logindata? logindata;

  usermodal({this.status, this.data, this.logindata});

  usermodal.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    data = json['data'];
    logindata = json['logindata'] != null
        ? new Logindata.fromJson(json['logindata'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    if (this.logindata != null) {
      data['logindata'] = this.logindata!.toJson();
    }
    return data;
  }
}

class Logindata {
  String? dId;
  String? fname;
  String? lname;
  String? mobileNo;
  String? emailId;
  String? address;
  String? password;
  String? confirmPassword;
  String? acIa;
  String? lastLoginTime;
  String? forgotPassKey;
  String? createdTime;

  Logindata(
      {this.dId,
        this.fname,
        this.lname,
        this.mobileNo,
        this.emailId,
        this.address,
        this.password,
        this.confirmPassword,
        this.acIa,
        this.lastLoginTime,
        this.forgotPassKey,
        this.createdTime});

  Logindata.fromJson(Map<dynamic, dynamic> json) {
    dId = json['d_id'];
    fname = json['fname'];
    lname = json['lname'];
    mobileNo = json['mobile_no'];
    emailId = json['email_id'];
    address = json['address'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    acIa = json['ac_ia'];
    lastLoginTime = json['last_login_time'];
    forgotPassKey = json['forgot_pass_key'];
    createdTime = json['created_time'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<String, dynamic>();
    data['d_id'] = this.dId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['mobile_no'] = this.mobileNo;
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