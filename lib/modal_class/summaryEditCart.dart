class summryEditCartProduct {
  String? status;

  summryEditCartProduct({this.status});

  summryEditCartProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}