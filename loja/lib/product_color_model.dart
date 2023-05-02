class ProductColor {
  String? hexValue;
  String? colorName;

  ProductColor({required this.hexValue, required this.colorName});

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      hexValue: json['hex_value'],
      colorName: json['colour_name'],
    );
  }
}
