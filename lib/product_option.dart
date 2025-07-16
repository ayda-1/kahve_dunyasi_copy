import 'package:kahve_dunyasi/product.dart';

class ProductOption {
  final String name;
  final List<ProductChoice> choices;
  final bool isRequired;

  ProductOption({
    required this.name,
    required this.choices,
    this.isRequired = false,
  });

  factory ProductOption.fromMap(Map<String, dynamic> map) {
    return ProductOption(
      name: map['name'] ?? '',
      choices: (map['choices'] as List<dynamic>)
          .map((choice) => ProductChoice.fromMap(choice))
          .toList(),
      isRequired: map['isRequired'] ?? false,
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
