import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/shopping_basket_manager.dart';
import 'package:kahve_dunyasi/widgets/chosen_shop.dart';

import 'product.dart';

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({super.key});

  @override
  State<ShoppingBasket> createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  bool isChecked = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final items = ShoppingBasketManager.items;


return Scaffold(
  appBar: AppBar(
    title: const Text("Sepetim"),
    backgroundColor: Colors.yellow.shade200,
    foregroundColor: Colors.pink.shade900,
    actions: [
      IconButton(onPressed: (){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Sepeti Boşalt"),
            content: const Text("Sepeti tamamen boşaltmak istediğinize emin misiniz?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("İptal"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    ShoppingBasketManager.clear();
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  "Evet",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      }, icon: Icon(Icons.delete_forever))
    ],
  ),
  body: items.isEmpty
      ? Center(
          child: Text(
            "Sepet boş",
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      : ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const ChosenShop(),
            const SizedBox(height: 12),
            Text(
              "Sepetinde ${ShoppingBasketManager.totalItems()} adet ürün var",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(height: 24),
            ...items.entries.map((entry) {
              final product = entry.key;
              final quantity = entry.value;

              return Card(
                
                shadowColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name,style: TextStyle(fontSize: 13),textAlign: TextAlign.start,),
                  subtitle: Text(
                    
                    "${(product.basePrice * quantity).toStringAsFixed(2)} TL",
                    
                    style: TextStyle(
                      color: Colors.pink.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade900),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.pink.shade900,
                          onPressed: () {
                            setState(() {
                              ShoppingBasketManager.removeOne(product);
                            });
                          },
                        ),
                        Text(
                          "$quantity",
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.pink.shade900,
                          onPressed: () {
                            setState(() {
                              ShoppingBasketManager.add(product);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Divider(height: 32),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.yellow.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.campaign_rounded, color: Colors.pink.shade900),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kampanyalar",
                        style: TextStyle(
                          color: Colors.pink.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sepetine uygun kampanyaları görüntüle!",
                        style: TextStyle(
                          color: Colors.pink.shade900,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_circle_right_outlined,
                      color: Colors.pink.shade900),
                ],
              ),
            ),
            SizedBox(height: 13,),
             Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: RadioListTile<bool>(
                value: true,
                groupValue: isChecked,
                onChanged: (val) {
                  setState(() {
                    isChecked = val!;
                  });
                },
                title: const Text(
                  'Promosyon Kodu Ekle',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                activeColor: Colors.pink.shade900,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            if (isChecked)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Promosyon kodu giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // promosyon kodu 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Uygula',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      

      
          ],
        ),
  
  bottomNavigationBar: Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, -2)),
      ],
    ),
    child: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ödenecek Tutar ",
                style: TextStyle(fontSize: 16,),
              ),
              Icon(Icons.arrow_circle_up_rounded,color: Colors.grey.shade600,),
              Spacer(),
              Text(
                "${ShoppingBasketManager.totalPrice().toStringAsFixed(2)} TL",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Siparişiniz alındı!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade300,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child:  Text(
                "Sepeti Onayla",
                style: TextStyle(fontSize: 16,color: Colors.pink.shade900),
              ),
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    ),
  ),
);

  }
}
