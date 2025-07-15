import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/order_categories.dart';
import 'package:kahve_dunyasi/product.dart';
import 'package:kahve_dunyasi/widgets/chosen_shop.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final List<Map<String, dynamic>> items = [
    {
      "image": "images/sicak_icecekler.png",
      "title": "Sıcak İçecekler",
      "icon": Icons.arrow_circle_right_outlined,
    },
    {
      "image": "images/kruvasan.png",
      "title": "Unlu Mamuller",
      "icon": Icons.arrow_circle_right_outlined,
    },
    {
      "image": "images/cikolata.png",
      "title": "Çikolata",
      "icon": Icons.arrow_circle_right_outlined,
    },
    {
      "image": "images/soguk_icecekler.png",
      "title": "Soğuk İçecekler",
      "icon": Icons.arrow_circle_right_outlined,
    },
    {
      "image": "images/tatli.png",
      "title": "Tatlı",
      "icon": Icons.arrow_circle_right_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChosenShop(),
              SizedBox(height: 13),
              Container(
                color: Colors.grey.shade100,
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text(
                      "Ürünler içinde ara",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 23),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // 1 satırda 2 öğe
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: items.map((item) {
                    return GestureDetector(
                      onTap: () {
                        String selectedCategory = item["title"];

                        // Bu kısmı kendin düzenleyerek farklı ürün listeleri verebilirsin
                        List<Map<String, dynamic>> categoryProductsData = [];

                        if (selectedCategory == "Sıcak İçecekler") {
                          categoryProductsData = [
                            {
                              "image": "images/cafe_latte.jpeg",
                              "name": "Cafe Latte",
                              "price": "100.00",
                              "description": "Sıcak süt ve espresso ile hazırlanan yumuşak içimli kahve.",
  "allergens": ["Süt", "Laktoz"],
                              
                            },
                            {
                              "image":
                                  "images/cokoliko_vitaminli_sicak_cikolata.jpeg",
                              "name": "Çokoliko Vitaminli Sıcak Çikolata",
                              "price": "165.00",
                            },
                            {
                              "image": "images/espresso_macchiato_double.jpeg",
                              "name": "Espresso Macchiato Double",
                              "price": "165.00",
                            },
                            {
                              "image": "images/filtre_kahve.jpeg",
                              "name": "Filtre Kahve",
                              "price": "165.00",
                            },
                            {
                              "image": "images/salepli_kahve.jpeg",
                              "name": "Salepli Kahve",
                              "price": "165.00",
                            },
                            {
                              "image": "images/sicak_cikolata.jpeg",
                              "name": "Sıcak Çikolata",
                              "price": "165.00",
                            },
                            {
                              "image": "images/turk_kahvesi_damla_sakizli.jpeg",
                              "name": "Türk Kahvesi Damla Sakızlı",
                              "price": "165.00",
                            },
                            {
                              "image": "images/vanilyali_filtre_kahve.jpeg",
                              "name": "Vanilyalı Filtre Kahve",
                              "price": "165.00",
                            },
                          ];
                        } else if (selectedCategory == "Çikolata") {
                          categoryProductsData = [
                            {
                              "image": "images/cikolata1.png",
                              "name": "Bitter Çikolata",
                              "price": "82.00",
                            },
                            {
                              "image": "images/cikolata2.png",
                              "name": "Sütlü Kare",
                              "price": "75.00",
                            },
                          ];
                        }
                        List<Product> categoryProducts =
    categoryProductsData.map((item) => Product.fromMap(item)).toList();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderCategories(
                              categoryTitle: selectedCategory,
                              products: categoryProducts,
                            ),
                          ),
                        );
                      },

                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(item["image"]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                item["title"],
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Row(
                              children: [
                                Icon(item["icon"], color: Colors.grey.shade400),
                                SizedBox(width: 6),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
