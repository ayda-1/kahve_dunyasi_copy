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
              size: 40,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(children: [Text("data")]),
                              Column(children: [Icon(Icons.coffee_sharp)]),
                            ],
                          ),
                          Row(children: [Text("data")]),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(children: [Text("data")]),
                              Column(children: [Icon(Icons.coffee_sharp)]),
                            ],
                          ),
                          Row(children: [Text("data")]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(children: [Text("Haberler ve Fırsatlar")]),
              PageViewFirstPage(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),

              PageDots(currentPage: _currentPage, pageCount: 3),

              const SizedBox(height: 16),

              Text("Kahve Dünyası Mağzalarını Keşfet"),
              Container(height: 200, width: 500, color: Colors.blue),
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
      height: 200,
      child: PageView(
        controller: controller,
        onPageChanged: onPageChanged, // 🔥 EKLENDİ!
        children: [
          Container(
            color: Colors.red,
            child: Center(child: Text("Sayfa 1")),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text("Sayfa 2")),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text("Sayfa 3")),
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
            color: currentPage == index ? Colors.pink : Colors.grey,
          ),
        );
      }),
    );
  }
}
