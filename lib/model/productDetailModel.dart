class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final int bostaSizeId;
  final double productRating;
  final int estimatedDaysPreparing;
  final dynamic sizeChart;
  final SubCategory subCategory;
  final List<Variation> variations;
  final List<AvailableProperty> availableProperties;
  final String brandName;
  final String brandImage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    required this.bostaSizeId,
    required this.productRating,
    required this.estimatedDaysPreparing,
    required this.sizeChart,
    required this.subCategory,
    required this.variations,
    required this.availableProperties,
    required this.brandName,
    required this.brandImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brandId: json['brand_id'],
      bostaSizeId: json['bosta_size_id'],
      productRating: json['product_rating'].toDouble(),
      estimatedDaysPreparing: json['estimated_days_preparing'],
      sizeChart: json['SizeChart'],
      subCategory: SubCategory.fromJson(json['subCategory']),
      variations: List<Variation>.from(json['variations'].map((v) => Variation.fromJson(v))),
      availableProperties: List<AvailableProperty>.from(
          json['avaiableProperties'].map((v) => AvailableProperty.fromJson(v))),
      brandName: json['brandName'],
      brandImage: json['brandImage'],
    );
  }
}

class SubCategory {
  final int id;
  final String name;

  SubCategory({required this.id, required this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Variation {
  final int id;
  final double price;
  final int quantity;
  final bool inStock;
  final List<ProductVarientImage> productVarientImages;
  final List<ProductPropertiesValue> productPropertiesValues;
  final String productStatus;
  final bool isDefault;
  final int productVariationStatusId;

  Variation({
    required this.id,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVarientImages,
    required this.productPropertiesValues,
    required this.productStatus,
    required this.isDefault,
    required this.productVariationStatusId,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      id: json['id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      inStock: json['inStock'],
      productVarientImages: List<ProductVarientImage>.from(
          json['ProductVarientImages'].map((v) => ProductVarientImage.fromJson(v))),
      productPropertiesValues: List<ProductPropertiesValue>.from(
          json['productPropertiesValues']
              .map((v) => ProductPropertiesValue.fromJson(v))),
      productStatus: json['productStatus'],
      isDefault: json['isDefault'],
      productVariationStatusId: json['product_variation_status_id'],
    );
  }
}

class ProductVarientImage {
  final int id;
  final String imagePath;
  final dynamic productVarientId;
  final String createdAt;
  final String updatedAt;

  ProductVarientImage({
    required this.id,
    required this.imagePath,
    required this.productVarientId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductVarientImage.fromJson(Map<String, dynamic> json) {
    return ProductVarientImage(
      id: json['id'],
      imagePath: json['image_path'],
      productVarientId: json['product_varient_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class ProductPropertiesValue {
  final String value;
  final String property;

  ProductPropertiesValue({required this.value, required this.property});

  factory ProductPropertiesValue.fromJson(Map<String, dynamic> json) {
    return ProductPropertiesValue(
      value: json['value'],
      property: json['property'],
    );
  }
}

class AvailableProperty {
  final String property;
  final List<PropertyValue> values;

  AvailableProperty({required this.property, required this.values});

  factory AvailableProperty.fromJson(Map<String, dynamic> json) {
    return AvailableProperty(
      property: json['property'],
      values: List<PropertyValue>.from(
          json['values'].map((v) => PropertyValue.fromJson(v))),
    );
  }
}

class PropertyValue {
  final String value;
  final int id;

  PropertyValue({required this.value, required this.id});

  factory PropertyValue.fromJson(Map<String, dynamic> json) {
    return PropertyValue(
      value: json['value'],
      id: json['id'],
    );
  }
}