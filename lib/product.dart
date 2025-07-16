import 'package:kahve_dunyasi/product_option.dart';

class Product {
  final String name;
  final String imageUrl;
  final double basePrice;
  final String? description; 
  final List<String>? allergens; 
  final List<ProductOption> options;

  Product({
    required this.name,
    required this.imageUrl,
    required this.basePrice,
    this.description,
    this.allergens,
    this.options = const [],
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      imageUrl: map['image'] ?? '',
      basePrice: double.tryParse(map['price'].toString()) ?? 0.0,
      description: map['description'],
      allergens: (map['allergens'] as List?)?.map((e) => e.toString()).toList(),
      options:
          (map['options'] as List<dynamic>?)
              ?.map((opt) => ProductOption.fromMap(opt))
              .toList() ??
          [],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imageUrl == other.imageUrl &&
          basePrice == other.basePrice &&
          description == other.description &&
          allergens == other.allergens &&
          options == other.options;

  @override
  int get hashCode =>
      name.hashCode ^
      imageUrl.hashCode ^
      basePrice.hashCode ^
      description.hashCode ^
      allergens.hashCode ^
      options.hashCode;
}

class ProductChoice {
  final String name;
  final double extraPrice;

  ProductChoice({required this.name, required this.extraPrice});

  factory ProductChoice.fromMap(Map<String, dynamic> map) {
    return ProductChoice(
      name: map['name'] ?? '',
      extraPrice: (map['extraPrice'] ?? 0).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductChoice &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          extraPrice == other.extraPrice;

  @override
  int get hashCode => name.hashCode ^ extraPrice.hashCode;
}
