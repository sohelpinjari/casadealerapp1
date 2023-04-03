class ViewCart {
  String? status;
  List<BlockMumbai>? blockMumbai;
  List<BlockTirupur>? blockTirupur;
  List<PriceProduct>? priceProduct;

  ViewCart(
      {this.status, this.blockMumbai, this.blockTirupur, this.priceProduct});

  ViewCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['block_mumbai'] != null) {
      blockMumbai = <BlockMumbai>[];
      json['block_mumbai'].forEach((v) {
        blockMumbai!.add(new BlockMumbai.fromJson(v));
      });
    }
    if (json['block_tirupur'] != null) {
      blockTirupur = <BlockTirupur>[];
      json['block_tirupur'].forEach((v) {
        blockTirupur!.add(new BlockTirupur.fromJson(v));
      });
    }
    if (json['price_product'] != null) {
      priceProduct = <PriceProduct>[];
      json['price_product'].forEach((v) {
        priceProduct!.add(new PriceProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.blockMumbai != null) {
      data['block_mumbai'] = this.blockMumbai!.map((v) => v.toJson()).toList();
    }
    if (this.blockTirupur != null) {
      data['block_tirupur'] =
          this.blockTirupur!.map((v) => v.toJson()).toList();
    }
    if (this.priceProduct != null) {
      data['price_product'] =
          this.priceProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlockMumbai {
  String? apColorName;
  String? mApdId;
  String? mApId;
  String? warehouseName;
  String? productName;
  String? size;
  String? blockedQuantity;

  BlockMumbai(
      {this.apColorName,
        this.mApdId,
        this.mApId,
        this.warehouseName,
        this.productName,
        this.size,
        this.blockedQuantity});

  BlockMumbai.fromJson(Map<String, dynamic> json) {
    apColorName = json['ap_color_name'];
    mApdId = json['m_apd_id'];
    mApId = json['m_ap_id'];
    warehouseName = json['warehouse_name'];
    productName = json['product_name'];
    size = json['size'];
    blockedQuantity = json['blocked_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ap_color_name'] = this.apColorName;
    data['m_apd_id'] = this.mApdId;
    data['m_ap_id'] = this.mApId;
    data['warehouse_name'] = this.warehouseName;
    data['product_name'] = this.productName;
    data['size'] = this.size;
    data['blocked_quantity'] = this.blockedQuantity;
    return data;
  }
}

class BlockTirupur {
  String? tApdId;
  String? tApId;
  String? warehouseName;
  String? productName;
  String? size;
  String? blockedQuantity;

  BlockTirupur(
      {this.tApdId,
        this.tApId,
        this.warehouseName,
        this.productName,
        this.size,
        this.blockedQuantity});

  BlockTirupur.fromJson(Map<String, dynamic> json) {
    tApdId = json['t_apd_id'];
    tApId = json['t_ap_id'];
    warehouseName = json['warehouse_name'];
    productName = json['product_name'];
    size = json['size'];
    blockedQuantity = json['blocked_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t_apd_id'] = this.tApdId;
    data['t_ap_id'] = this.tApId;
    data['warehouse_name'] = this.warehouseName;
    data['product_name'] = this.productName;
    data['size'] = this.size;
    data['blocked_quantity'] = this.blockedQuantity;
    return data;
  }
}

class PriceProduct {
  int? minPrice;
  int? maxPrice;

  PriceProduct({this.minPrice, this.maxPrice});

  PriceProduct.fromJson(Map<String, dynamic> json) {
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    return data;
  }
}