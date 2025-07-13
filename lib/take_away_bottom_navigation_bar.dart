import 'package:flutter/material.dart';
import 'take_away_page.dart'; // sayfalarını buraya import et

class TakeAwayBottomNavigationBar extends StatefulWidget {
  const TakeAwayBottomNavigationBar({super.key});

  @override
  State<TakeAwayBottomNavigationBar> createState() => _TakeAwayBottomNavigationBar();
}

class _TakeAwayBottomNavigationBar extends State<TakeAwayBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    TakeAwayPage(),
    Center(child: Text("Sipariş Ver")),
    Center(child: Text("Sepetim")),
    Center(child: Text("Siparişlerim")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hoş geldin,",
              style: TextStyle(color: Colors.pink.shade900, fontSize: 13),
            ),
            Row(
              children: [
                Text(
                  "Ayda Nur Karaduman",
                  style: TextStyle(
                    color: Colors.pink.shade900,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 18,
                  color: Colors.pink.shade900,
                ),
              ],
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset("images/kahve_dunyasi_logo.png"),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.pink.shade900,
            child: Icon(
              Icons.qr_code_rounded,
              size: 30,
              color: Colors.yellow.shade200,
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.coffee), label: "Hazır Al"),
          BottomNavigationBarItem(
              icon: Icon(Icons.coffee_maker), label: "Sipariş Ver"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Sepetim"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), label: "Siparişlerim"),
        ],
      ),
    );
  }
}
