import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/entry_page.dart';
import 'package:kahve_dunyasi/order.dart';
import 'package:kahve_dunyasi/previous_orders.dart';
import 'package:kahve_dunyasi/shopping_basket.dart';
import 'take_away_page.dart';

class TakeAwayBottomNavigationBar extends StatefulWidget {
  const TakeAwayBottomNavigationBar({super.key});

  @override
  State<TakeAwayBottomNavigationBar> createState() =>
      _TakeAwayBottomNavigationBarState();
}

class _TakeAwayBottomNavigationBarState
    extends State<TakeAwayBottomNavigationBar> {
  int _selectedIndex = 0;
  bool showExtraMenu = false;

  final List<Widget> _pages = [
    TakeAwayPage(),
    Order(),
    ShoppingBasket(),
    PreviousOrders(),
    EntryPage(),
    TakeAwayPage(),
    
    Scaffold(body: Center(child: Text("Online Mağaza"))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      showExtraMenu = false; // ekstra menüdeyken sayfa değişince kapansın
    });
  }

  @override
  Widget build(BuildContext context) {
    // Normal butonlar
    List<Widget> mainButtons = [
      _buildNavIcon(Icons.local_cafe_outlined, 0, "Hazır Al",),
      _buildNavIcon(Icons.local_cafe, 1, "Spariş Ver"),
      _buildNavIcon(Icons.shopping_bag_outlined, 2, "Sepetim"),
      _buildNavIcon(Icons.lock_clock, 3, "Sparişlerim"),
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(color: Colors.yellow.shade200,borderRadius: BorderRadius.circular(20)),
        child: IconButton(
          icon: const Icon(Icons.grid_view,),
          onPressed: () {
            setState(() {
              showExtraMenu = true;
            });
          },
        ),
      ),
    ];

    // Ekstra butonlar
    List<Widget> extraButtons = [
      _buildNavIcon(Icons.home, 4, "Ana Sayfa"),
      _buildNavIcon(Icons.local_cafe_outlined, 5, "Hazır Al"),
      _buildNavIcon(Icons.shop, 6, "Online Mağaza"),
       Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(color: Colors.yellow.shade200,borderRadius: BorderRadius.circular(20)),
        child: IconButton(
          icon: const Icon(Icons.grid_view,),
          onPressed: () {
            setState(() {
              showExtraMenu = false;
            });
          },
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: showExtraMenu ? Colors.yellow.shade100 : Colors.white,
                

                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: showExtraMenu ? extraButtons : mainButtons,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.pink.shade900 : Colors.black54),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.pink.shade900 : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
