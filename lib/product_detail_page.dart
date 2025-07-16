import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/product.dart';
import 'package:kahve_dunyasi/product_option.dart';

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
    final sizeOption = widget.product.options.firstWhere(
      (opt) => opt.name == "Boy Seçimi",
      orElse: () =>
          ProductOption(name: "Boy Seçimi", choices: [], isRequired: false),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.product.imageUrl,
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (widget.product.description != null)
                            Text(
                              widget.product.description!,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${widget.product.basePrice.toStringAsFixed(2)}₺",
                                style: TextStyle(
                                  color: Colors.pink.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          if (widget.product.allergens != null &&
                              widget.product.allergens!.isNotEmpty)
                            Row(
                              children: [
                                Icon(Icons.eco_rounded, color: Colors.green),
                                Text("Alerjenler: "),
                                Text(
                                  " ${widget.product.allergens!.join(", ")}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red.shade700,
                                  ),
                                ),
                              ],
                            ),

                          SizedBox(height: 10),

                          // ✅ Boy Seçimi buraya alındı
                          if (sizeOption.choices.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Boy Seçimi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: sizeOption.choices.map((choice) {
                                    final isSelected =
                                        selectedChoices["Boy Seçimi"] == choice;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedChoices["Boy Seçimi"] =
                                              choice;
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 120,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.yellow.shade100
                                              : Colors.white,
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.pink.shade900
                                                : Colors.grey.shade400,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.local_cafe,
                                              size: () {
                                                if (choice.name
                                                    .toLowerCase()
                                                    .contains("küçük"))
                                                  return 28.0;
                                                if (choice.name
                                                    .toLowerCase()
                                                    .contains("orta"))
                                                  return 36.0;
                                                if (choice.name
                                                    .toLowerCase()
                                                    .contains("büyük"))
                                                  return 44.0;
                                                return 32.0; // varsayılan
                                              }(),
                                              color: isSelected
                                                  ? Colors.pink.shade900
                                                  : Colors.grey,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(choice.name),
                                            Text(
                                              "+${choice.extraPrice.toStringAsFixed(2)}₺",
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(),
                                ),
                              ],
                            ),

                          const SizedBox(height: 12),

                          // Aroma vb. diğer seçenekler aşağıya alındı
                          ...widget.product.options
                              .where((o) => o.name != "Boy Seçimi")
                              .map((option) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      option.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 10,
                                      children: option.choices.map((choice) {
                                        final selected =
                                            selectedChoices[option.name] ==
                                            choice;
                                        return InkWell(
  onTap: () {
    setState(() {
      selectedChoices[option.name] = selected ? null : choice;
    });
  },
 
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? Colors.yellow.shade100 : Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: selected ? Colors.pink.shade900 : Colors.grey.shade400,
        width: 1.5,
      ),
    ),
    child: Text(
      "${choice.name} +${choice.extraPrice.toStringAsFixed(2)}₺",
      style: TextStyle(
        color: selected ? Colors.grey.shade700 : Colors.black87,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  ),
);

                                      }).toList(),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 1),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ödenecek Tutar",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "${calculateTotalPrice().toStringAsFixed(2)}₺",
                              style: TextStyle(
                                color: Colors.pink.shade900,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => setState(() {
                                      if (quantity > 1) quantity--;
                                    }),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    quantity.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => setState(() {
                                      quantity++;
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, {
                                  'product': widget.product,
                                  'quantity': quantity,
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.shade300,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(200, 50),
                              ),
                              child: Text(
                                "Sepete Ekle",
                                style: TextStyle(color: Colors.pink.shade900),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
