import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
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
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hoş geldin,", style: Theme.of(context).textTheme.titleSmall),
            Row(
              children: [
                Text(
                  "Ayda Nur Karaduman",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_circle_right_outlined, size: 18),
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
            child: Icon(
              Icons.qr_code_rounded,
              size: 30,
              color: Colors.pink.shade900,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.pink.shade600,
                child: Row(
                  children: [Icon(Icons.coffee), Icon(Icons.coffee_maker)],
                ),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TakeAwayButton(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: OnlineShopButton(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13),
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

              PageDots(currentPage: _currentPage, pageCount: 6),

              const SizedBox(height: 16),

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
              SizedBox(height: 10,),
              Container(child: Image.asset("images/map.png",fit: BoxFit.fill,),),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/entryScreen");
                },
                child: Text("Ana sayfaya git"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnlineShopButton extends StatelessWidget {
  const OnlineShopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
Navigator.of(context).pushNamed("/onlineShopPage");
        
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Online \nMağaza",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 13),
                Text(
                  "Alışverişe Başla",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TakeAwayButton extends StatelessWidget {
  const TakeAwayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
Navigator.of(context).pushNamed("/takeAwayPage");
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Hazır Al\n",
                      style: TextStyle(
                        color: Colors.pink.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.coffee_sharp,
                      size: 50,
                      color: Colors.pink.shade900,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 13),
                Text(
                  "Sipariş Ver",
                  style: TextStyle(
                    color: Colors.pink.shade900,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.pink.shade900,
                  size: 14,
                ),
              ],
            ),
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
                  image: AssetImage("images/offer1.png"),
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
                  image: AssetImage("images/offer2.png"),
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
                  image: AssetImage("images/offer3.png"),
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
                  image: AssetImage("images/offer4.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("images/offer5.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),Padding(
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
