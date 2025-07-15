import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map<String, ProductChoice?> selectedChoices = {};
  int quantity = 1;

  double calculateTotalPrice() {
    double total = widget.product.basePrice;
    for (var choice in selectedChoices.values) {
      if (choice != null) total += choice.extraPrice;
    }
    return total * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Column(
        children: [
          Image.asset(widget.product.imageUrl),
          const SizedBox(height: 10),
          Text(widget.product.name, style: TextStyle(fontSize: 20)),

          // Dinamik Seçenekler
          ...widget.product.options.map((option) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 10,
                  children: option.choices.map((choice) {
                    final selected = selectedChoices[option.name] == choice;
                    return ChoiceChip(
                      label: Text(
                        "${choice.name} +${choice.extraPrice.toStringAsFixed(2)}₺",
                      ),
                      selected: selected,
                      onSelected: (val) {
                        setState(() {
                          selectedChoices[option.name] = val ? choice : null;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
              ],
            );
          }),

          // Adet
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(() {
                  if (quantity > 1) quantity--;
                }),
              ),
              Text(quantity.toString(), style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() {
                  quantity++;
                }),
              ),
            ],
          ),

          // Fiyat ve Sepete Ekle
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Toplam: ${calculateTotalPrice().toStringAsFixed(2)}₺",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
  onPressed: () {
    Navigator.pop(context, {
  'product': widget.product,
  'quantity': quantity,
  // 'selectedChoices': selectedChoices, // Opsiyon kullanıyorsan ekle
});
// sepete eklemeden önce bazı işlemler
  },
  child: Text("Sepete Ekle"),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
