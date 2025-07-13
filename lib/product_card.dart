
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  ProductCard({
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16)),
           SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
                        
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle_outline,
                      color: Colors.purple.shade700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}