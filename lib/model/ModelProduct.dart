class Products {
  final int productId;
  final String title;
  final double price;
  final int categoryId;
  final int brandId;
  final int quality;
  final String description;
  final String shortDescription;
  final String image;
  final bool status;
  final String isFeature;

  Products({
    required this.productId,
    required this.title,
    required this.price,
    required this.categoryId,
    required this.brandId,
    required this.quality,
    required this.description,
    required this.shortDescription,
    required this.image,
    required this.status,
    required this.isFeature,
  });
}
