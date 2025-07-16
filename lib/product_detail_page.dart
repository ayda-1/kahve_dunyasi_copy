import 'dart:math';

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
                          // Ürün adı
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Açıklama
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

                          // Alerjen bilgisi
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

                          const SizedBox(height: 12),

                          // Seçenekler
                          ...widget.product.options.map((option) {
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
                                        selectedChoices[option.name] == choice;
                                    return ChoiceChip(
                                      label: Text(
                                        "${choice.name} +${choice.extraPrice.toStringAsFixed(2)}₺",
                                      ),
                                      selected: selected,
                                      onSelected: (val) {
                                        setState(() {
                                          selectedChoices[option.name] = val
                                              ? choice
                                              : null;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                          Row(children: [Text("Boy Seçimi")]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 150,
                                width: 120,

                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  border: Border.all(
                                    color: Colors.pink.shade900,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Icon(
                                      Icons.coffee_rounded,
                                      size: 40,
                                      color: Colors.pink.shade900,
                                    ),
                                    Text("Küçük"),
                                    Text(
                                      "${calculateTotalPrice().toStringAsFixed(2)}₺",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,

                                  border: Border.all(
                                    color: Colors.pink.shade900,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.coffee_rounded,
                                      size: 55,
                                      color: Colors.pink.shade900,
                                    ),
                                    Text("Orta"),
                                    Text(
                                      "${(calculateTotalPrice() + 10.0).toStringAsFixed(2)}₺",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,

                                  border: Border.all(
                                    color: Colors.pink.shade900,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.coffee_rounded,
                                      size: 66,
                                      color: Colors.pink.shade900,
                                    ),
                                    Text("Büyük"),

                                    Text(
                                      "${(calculateTotalPrice() + 20.0).toStringAsFixed(2)}₺",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 80,
                          ), // Sabit alt kısmın üstü boşluk
                        ],
                      ),
                    ),
                  ),

                  // ALTTA SABİT KISIM
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 6),
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
