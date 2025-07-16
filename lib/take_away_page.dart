import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/product_card.dart';
import 'package:kahve_dunyasi/widgets/offers.dart';

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                color: Colors.yellow.shade300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 2,
                      ),
                      child: Image.asset("images/bardak2.jpeg"),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Biri Bizden",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 110, 0, 48),
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "0 ",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 110, 0, 48),
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.coffee,
                              color: const Color.fromARGB(255, 110, 0, 48),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Çekirdeklerim",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 110, 0, 48),
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "22,95",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 110, 0, 48),
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.eco,
                              color: const Color.fromARGB(255, 110, 0, 48),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Offers(
                      imagePath: "images/icon1.jpeg",
                      label: "Orijin Serisi",
                    ),
                    Offers(
                      imagePath: "images/icon2.jpeg",
                      label: "Özel Seri Kahveler",
                    ),
                    Offers(imagePath: "images/icon3.jpeg", label: "Cacaonly"),
                    Offers(
                      imagePath: "images/icon4.jpeg",
                      label: "Bu Dünya Hepimizin",
                    ),
                    Offers(
                      imagePath: "images/icon5.jpeg",
                      label: "Bizden Söylemesi",
                    ),
                    Offers(imagePath: "images/icon6.jpeg", label: "Popcorn"),
                    Offers(
                      imagePath: "images/icon7.jpeg",
                      label: "Kapsül Kahve",
                    ),
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
              SizedBox(height: 20),
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
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 250,

                  child: Row(
                    children: [
                      ProductCard(
                        imagePath: 'images/gofrik.png',
                        title: 'Gofrik Sütlü',
                        price: '37,00 TL',
                      ),
                      SizedBox(width: 12),
                      ProductCard(
                        imagePath: 'images/kruvasan.png',
                        title: 'Kruvasan',
                        price: '85,00 TL',
                      ),
                      SizedBox(width: 12),
                      ProductCard(
                        imagePath: 'images/gofrik.png',
                        title: 'Kruvasan',
                        price: '85,00 TL',
                      ),
                      SizedBox(width: 12),
                      ProductCard(
                        imagePath: 'images/gofrik.png',
                        title: 'Kruvasan',
                        price: '85,00 TL',
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(width: 13),
                  Text(
                    "Kahve Dünyası Mağazalarını Keşfet",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(child: Image.asset("images/map.png", fit: BoxFit.fill)),
            ],
          ),
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
                  image: AssetImage("images/offer8.png"),
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
                  image: AssetImage("images/offer7.png"),
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
                  image: AssetImage("images/offer6.png"),
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
