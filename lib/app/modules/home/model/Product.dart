class ProductModel {
  int? status;
  String? message;
  List<Data>? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  double? price;
  String? description;
  String? shortDescription;
  String? image;
  int? categoryId;
  int? brandId;
  int? quantity;
  int? status;
  String? isFeature;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Data(
      {this.id,
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
        this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    shortDescription = json['short_description'];
    image = json['image'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    quantity = json['quantity'];
    status = json['status'];
    isFeature = json['is_feature'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['is_feature'] = this.isFeature;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
