import 'package:flutter/material.dart';

class PreviousOrders extends StatelessWidget {
  const PreviousOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spariş Geçmişim"),
        backgroundColor: Colors.yellow.shade200,
        foregroundColor: Colors.pink.shade900,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.shade300,
              ),
              child: Icon(Icons.shopping_basket_rounded),
            ),
            SizedBox(height: 25),
            Text(
              "Sipariş Geçmişim",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Henüz hiç sipariş oluşturmadın",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
