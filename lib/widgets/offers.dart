
import 'package:flutter/material.dart';


class Offers extends StatelessWidget {
  final String imagePath;
  final String label;

  const Offers({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade900, width: 2),
              borderRadius: BorderRadius.circular(17),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            
            width:59,child: Text(textAlign: TextAlign.center,label, style: const TextStyle(fontSize: 10))),
        ],
      ),
    );
  }
}
