import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hoş geldin,",style: Theme.of(context).textTheme.titleSmall,),
            Row(
              children: [
                Text("Ayda Nur Karaduman",style: Theme.of(context).textTheme.titleSmall,),
                SizedBox(width: 5,),
                Icon(Icons.arrow_circle_right_outlined,size: 18,)
              ],
            ),
          ],
        ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Image.asset("images/kahve_dunyasi_logo.png"),
      ),
      actions: [CircleAvatar(child: Icon(Icons.qr_code_rounded,size: 40,color: Colors.pink.shade900,))],
      ),
      body: Center(
        child: Column(
        
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
              children: [
              Expanded(
                child: Container(decoration: BoxDecoration(color: Colors.amberAccent.shade100),child: Column(
                  children: [Row(children: [
                    Column(
                    children: [
                      Text("data"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.coffee_sharp),
                    ],
                  ),
                  ],),Row(children: [Text("data")],)],
                ),),
              ),
               Expanded(
                child: Container(decoration: BoxDecoration(color: Colors.teal.shade600
                ),child: Column(
                  children: [Row(children: [
                    Column(
                    children: [
                      Text("data"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.coffee_sharp),
                    ],
                  ),
                  ],),Row(children: [Text("data")],)],
                ),),
              ),
            
                         
            ],),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/entryScreen");
              },
              child: Text("Ana sayfaya git"),
            ),
        
          ],
        ),
        
      ),
    );
  }
}
