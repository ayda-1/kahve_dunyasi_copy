import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/product_card.dart';

class TakeAwayPage extends StatefulWidget {
  const TakeAwayPage({super.key});

  @override
  State<TakeAwayPage> createState() => _TakeAwayPageState();
}

class _TakeAwayPageState extends State<TakeAwayPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Offers(),
                  Offers(),
                  Offers(),
                  Offers(),
                  Offers(),
                  Offers(),
                  Offers(),
                  Offers(),
                  Offers(),
                ],
              ),
            ),

            Row(
              children: [
                SizedBox(width: 13),
                Text(
                  "Haberler ve Fırsatlar",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            PageViewFirstPage(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),

            PageDots(currentPage: _currentPage, pageCount: 3),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 13),
                Text(
                  "Mağaza Sparişlerine Özel",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.all(16),
  child: SizedBox(
    height: 160,
    child: Row(
      children:  [
        ProductCard(imagePath: 'images/gofrik.png', title: 'Gofrik Sütlü', price: '37,00 TL'),
        SizedBox(width: 12),
        ProductCard(imagePath: 'images/gofrik.png', title: 'Kruvasan', price: '85,00 TL'),
        SizedBox(width: 12),
        ProductCard(imagePath: 'images/gofrik.png', title: 'Kruvasan', price: '85,00 TL'),
        SizedBox(width: 12),
        ProductCard(imagePath: 'images/gofrik.png', title: 'Kruvasan', price: '85,00 TL'),
      ],
    ),
  ),
)


          ],
        ),
      ),
    );
  }
}

class PageViewFirstPage extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const PageViewFirstPage({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView(
        controller: controller,
        onPageChanged: onPageChanged, // 🔥 EKLENDİ!
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("images/dondurma.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("images/dondurma.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("images/dondurma.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageDots extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageDots({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.grey.shade800 : Colors.grey,
          ),
        );
      }),
    );
  }
}

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink.shade900, width: 2),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(Icons.food_bank_outlined),
            ),
            Text("data"),
          ],
        ),
      ],
    );
  }
}
