class view_orders {
  String? status;
  List<Data>? data;

  view_orders({this.status, this.data});

  view_orders.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? fullName;
  String? id;
  int? productNumberOrder;
  String? ordNo;
  String? price;
  String? status;

  Data(
      {this.fullName,
        this.id,
        this.productNumberOrder,
        this.ordNo,
        this.price,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    id = json['id'];
    productNumberOrder = json['product_number_order'];
    ordNo = json['ord_no'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['id'] = this.id;
    data['product_number_order'] = this.productNumberOrder;
    data['ord_no'] = this.ordNo;
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}