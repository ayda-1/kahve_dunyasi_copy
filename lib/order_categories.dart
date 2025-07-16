import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/product.dart';
import 'package:kahve_dunyasi/product_detail_page.dart';
import 'package:kahve_dunyasi/shopping_basket.dart';
import 'package:kahve_dunyasi/shopping_basket_manager.dart';
import 'package:kahve_dunyasi/widgets/chosen_shop.dart';

class OrderCategories extends StatefulWidget {
  final String categoryTitle;
  final List<Product> products;

  const OrderCategories({
    super.key,
    required this.categoryTitle,
    required this.products,
  });

  @override
  State<OrderCategories> createState() => _OrderCategoriesState();
}

class _OrderCategoriesState extends State<OrderCategories> {
  List<Product> displayedProducts = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    displayedProducts = widget.products;
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      displayedProducts = widget.products
          .where((product) => product.name.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
        backgroundColor: Colors.yellow.shade300,
        foregroundColor: Colors.pink.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChosenShop(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                onChanged: updateSearch,
                decoration: InputDecoration(
                  hintText: "Ürün ara...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ), // bu hala kayıyo sonra düzeltilecek

            Expanded(
              child: GridView.builder(
                itemCount: displayedProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 sütun
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),

                itemBuilder: (context, index) {
                  final product = displayedProducts[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 6,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text("${product.basePrice} TL"),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: Colors.pink,
                                      ),
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailPage(
                                                  product: product,
                                                ),
                                          ),
                                        );

                                        if (result == true) {
                                          // Eğer sadece true dönmüşse, bildirimi göster (eski kullanım)
                                          _showTopNotification(
                                            context,
                                            product,
                                          );
                                        } else if (result is Map) {
                                          final Product prod =
                                              result['product'];
                                          final int qty = result['quantity'];
                                          // Sepete qty kadar ekle
                                          for (int i = 0; i < qty; i++) {
                                            ShoppingBasketManager.add(prod);
                                          }
                                          _showTopNotification(context, prod);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showTopNotification(BuildContext context, Product product) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16,
      right: 16,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(product.imageUrl, width: 40, height: 40),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "${product.name} sepete eklendi!",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingBasket(),
                    ),
                  );

                  if (result == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product.name} sepete eklendi."),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: const Text("Sepete Git"),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
