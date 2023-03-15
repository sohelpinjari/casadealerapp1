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
  String? prodImgOne;
  String? prodImgTwo;
  String? prodImgThree;
  int? minPrice;
  int? maxPrice;

  DiffProduct(
      {this.id,
        this.name,
        this.desc,
        this.color,
        this.prodImgOne,
        this.prodImgTwo,
        this.prodImgThree,
        this.minPrice,
        this.maxPrice});

  DiffProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    color = json['color'];
    prodImgOne = json['prod_img_one'];
    prodImgTwo = json['prod_img_two'];
    prodImgThree = json['prod_img_three'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['color'] = this.color;
    data['prod_img_one'] = this.prodImgOne;
    data['prod_img_two'] = this.prodImgTwo;
    data['prod_img_three'] = this.prodImgThree;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    return data;
  }
}