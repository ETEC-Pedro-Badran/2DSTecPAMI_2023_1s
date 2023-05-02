import 'product_color_model.dart';

class ProductList {
  List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> products = json.map((i) => Product.fromJson(i)).toList();
    return ProductList(products: products);
  }
}

class Product {
  int id;
  String? brand;
  String? name;
  double? price;
  String? priceSign;
  String? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? category;
  String? productType;
  List<String>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor> productColors;

  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    this.rating,
    required this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
    required this.productColors,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<ProductColor> productColors = [];
    if (json['product_colors'] != null) {
      productColors = (json['product_colors'] as List)
          .map((i) => ProductColor.fromJson(i))
          .toList();
    }
    return Product(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      price: double.parse(json['price']),
      priceSign: json['price_sign'] ?? "R\$",
      currency: json['currency'] ?? "",
      imageLink: json['image_link'],
      productLink: json['product_link'],
      websiteLink: json['website_link'],
      description: json['description'],
      rating: json['rating'] != null ? json['rating'] : null,
      category: json['category'],
      productType: json['product_type'],
      tagList: List<String>.from(json['tag_list']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      productApiUrl: json['product_api_url'],
      apiFeaturedImage: json['api_featured_image'],
      productColors: productColors,
    );
  }
}
