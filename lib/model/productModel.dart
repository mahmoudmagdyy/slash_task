class DetailModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  DetailModel({this.statusCode, this.message, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  int? brandId;
  int? bostaSizeId;
  Brands? brands;
  List<ProductVariations>? productVariations;


  Data(
      {this.id,
        this.name,
        this.description,
        this.brandId,
        this.bostaSizeId,
        this.brands,
        this.productVariations,

      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    brands =
    json['Brands'] != null ? new Brands.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = <ProductVariations>[];
      json['ProductVariations'].forEach((v) {
        productVariations!.add(new ProductVariations.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['brand_id'] = this.brandId;
    data['bosta_size_id'] = this.bostaSizeId;
    if (this.brands != null) {
      data['Brands'] = this.brands!.toJson();
    }
    if (this.productVariations != null) {
      data['ProductVariations'] =
          this.productVariations!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Brands {
  int? id;
  String? brandName;
  String? brandLogoImagePath;



  Brands(
      {this.id,
        this.brandName,
        this.brandLogoImagePath,
      });

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandLogoImagePath = json['brand_logo_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['brand_logo_image_path'] = this.brandLogoImagePath;

    return data;
  }
}

class ProductVariations {
  int? id;
  int? productId;
  int? price;
  int? quantity;
  int? productVariationStatusId;
  List<ProductVarientImages>? productVarientImages;

  ProductVariations(
      {this.id,
        this.productId,
        this.price,
        this.quantity,
        this.productVariationStatusId,
        this.productVarientImages});

  ProductVariations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    productVariationStatusId = json['product_variation_status_id'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(new ProductVarientImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['product_variation_status_id'] = this.productVariationStatusId;

    if (this.productVarientImages != null) {
      data['ProductVarientImages'] =
          this.productVarientImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductStatusLookups {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  ProductStatusLookups({this.id, this.name, this.createdAt, this.updatedAt});

  ProductStatusLookups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class ProductVarientImages {
  int? id;
  String? imagePath;


  ProductVarientImages(
      {this.id,
        this.imagePath,});

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    return data;
  }
}

