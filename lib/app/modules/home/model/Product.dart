class ProductModel {
  final int? status;
  final String? message;
  final List<ProductData>? data;

  ProductModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<ProductData>.from(
              json['data'].map((item) => ProductData.fromJson(item)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class ProductData {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? shortDescription;
  final String? image;
  final int? categoryId;
  final int? brandId;
  final int? quantity;
  final int? status;
  final String? isFeature;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;

  ProductData({
    this.id,
    this.title,
    this.price,
    this.description,
    this.shortDescription,
    this.image,
    this.categoryId,
    this.brandId,
    this.quantity,
    this.status,
    this.isFeature,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'],
      shortDescription: json['short_description'],
      image: json['image'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      quantity: json['quantity'],
      status: json['status'],
      isFeature: json['is_feature'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'short_description': shortDescription,
      'image': image,
      'category_id': categoryId,
      'brand_id': brandId,
      'quantity': quantity,
      'status': status,
      'is_feature': isFeature,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
    };
  }
}
