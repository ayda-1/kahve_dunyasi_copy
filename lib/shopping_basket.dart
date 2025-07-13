import 'package:flutter/material.dart';

class ShoppingBasket extends StatelessWidget {
  const ShoppingBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: Center(
        child: Column(
          
          children: [
          Container(
            
            height: 100,
            width: 380,
            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(20))
            ,child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/kahve_dunyasi_logo.png"),
                ),
                Column(children: [
                  Text("Seçtiğiniz Mağaza:",style: TextStyle(color: Colors.grey.shade600),),
                  Text("Ataköy A Plus",style: TextStyle(color: Colors.black),),
                  Row(
                    children: [
                      Text("Seçimi Buradan Değiştirebilirsin",style: TextStyle(color: Colors.pink.shade900),),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_circle_right_outlined,color: Colors.pink.shade900,size: 20,)
                    ],
                  ),
                ],)
              ],),
            ),
            ),
          
        
        ],),
      ),
    );
  }
}