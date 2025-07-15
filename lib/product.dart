class Product {
  final String name;
  final String imageUrl;
  final double basePrice;
  final String? description; // ✔ açıklama eklendi
  final List<String>? allergens; // ✔ alerjenler eklendi
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
      options: (map['options'] as List<dynamic>?)
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

class ProductOption {
  final String name;
  final List<ProductChoice> choices;

  ProductOption({
    required this.name,
    required this.choices,
  });

  factory ProductOption.fromMap(Map<String, dynamic> map) {
    return ProductOption(
      name: map['name'] ?? '',
      choices: (map['choices'] as List<dynamic>)
          .map((choice) => ProductChoice.fromMap(choice))
          .toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOption &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          choices == other.choices;

  @override
  int get hashCode => name.hashCode ^ choices.hashCode;
}

class ProductChoice {
  final String name;
  final double extraPrice;

  ProductChoice({
    required this.name,
    required this.extraPrice,
  });

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
