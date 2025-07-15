// cart_manager.dart
import 'product.dart';
class ShoppingBasketManager {
  static final Map<Product, int> _items = {};

  static Map<Product, int> get items => _items;

  static void add(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
  }

  static void removeOne(Product product) {
    if (_items.containsKey(product)) {
      if (_items[product]! > 1) {
        _items[product] = _items[product]! - 1;
      } else {
        _items.remove(product);
      }
    }
  }

  static void removeProduct(Product product) {
    _items.remove(product);
  }

  static void clear() {
    _items.clear();
  }

  static int totalItems() {
    return _items.values.fold(0, (sum, qty) => sum + qty);
  }

  static double totalPrice() {
    return _items.entries.fold(0.0,
      (sum, entry) => sum + entry.key.basePrice * entry.value);
  }
}
