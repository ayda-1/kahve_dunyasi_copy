import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/order.dart';
import 'package:kahve_dunyasi/previous_orders.dart';
import 'package:kahve_dunyasi/shopping_basket.dart';
import 'take_away_page.dart'; // sayfalarını buraya import et

class TakeAwayBottomNavigationBar extends StatefulWidget {
  const TakeAwayBottomNavigationBar({super.key});

  @override
  State<TakeAwayBottomNavigationBar> createState() =>
      _TakeAwayBottomNavigationBar();
}

class _TakeAwayBottomNavigationBar extends State<TakeAwayBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    TakeAwayPage(),
    Order(),
    ShoppingBasket(),
    PreviousOrders(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Hazır Al"),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee_maker),
            label: "Sipariş Ver",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sepetim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Siparişlerim",
          ),
        ],
      ),
    );
  }
}
