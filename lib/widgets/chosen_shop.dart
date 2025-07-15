import 'package:flutter/material.dart';

class ChosenShop extends StatelessWidget {
  const ChosenShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 170,width: 50,child: Image.asset("images/kahve_dunyasi_logo.png",)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Seçtiğiniz Mağaza:",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Text(
                "Ataköy A Plus",
                style: TextStyle(color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    "Seçimi Buradan Değiştirebilirsin",
                    style: TextStyle(color: Colors.pink.shade900),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.pink.shade900,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
