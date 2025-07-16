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
                          const SizedBox(height: 12),
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
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.yellow.shade300
                                              : Colors.yellow.shade100,
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
                                          children: [
                                            Icon(
                                              Icons.local_cafe,
                                              size: isSelected ? 40 : 32,
                                              color: Colors.pink.shade900,
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
                              ],
                            ),
                          const SizedBox(height: 80),
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
