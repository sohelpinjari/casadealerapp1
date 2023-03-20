class categorywisedisplay {
  String? status;
  List<DiffProduct>? diffProduct;

  categorywisedisplay({this.status, this.diffProduct});

  categorywisedisplay.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['diff_product'] != null) {
      diffProduct = <DiffProduct>[];
      json['diff_product'].forEach((v) {
        diffProduct!.add(new DiffProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.diffProduct != null) {
      data['diff_product'] = this.diffProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DiffProduct {
  String? id;
  String? name;
  String? desc;
  String? color;
  String? prodImgDefault;
  String? prodImgMen;
  String? prodImgWomen;
  int? minPrice;
  int? maxPrice;

  DiffProduct(
      {this.id,
        this.name,
        this.desc,
        this.color,
        this.prodImgDefault,
        this.prodImgMen,
        this.prodImgWomen,
        this.minPrice,
        this.maxPrice});

  DiffProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    color = json['color'];
    prodImgDefault = json['prod_img_default'];
    prodImgMen = json['prod_img_men'];
    prodImgWomen = json['prod_img_women'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['color'] = this.color;
    data['prod_img_default'] = this.prodImgDefault;
    data['prod_img_men'] = this.prodImgMen;
    data['prod_img_women'] = this.prodImgWomen;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    return data;
  }
}