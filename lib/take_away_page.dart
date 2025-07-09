import 'package:flutter/material.dart';

class TakeAwayPage extends StatelessWidget {
  const TakeAwayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("entryPage");
              },
              child: Text("2. sayfaya git"),
            ),
          ],
        ),
      ),
    );
  }
}
