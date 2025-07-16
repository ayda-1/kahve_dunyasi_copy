import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<String> code = List.filled(6, '');

  void onKeyTap(String value) {
    for (int i = 0; i < code.length; i++) {
      if (code[i] == '') {
        setState(() {
          code[i] = value;
        });
        break;
      }
    }

    if (code.every((digit) => digit != '')) {
      // tüm kod dolunca işlem
      Navigator.pushReplacementNamed(context, "/entry");
    }
  }

  void deleteLastDigit() {
    for (int i = 5; i >= 0; i--) {
      if (code[i] != '') {
        setState(() {
          code[i] = '';
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Güvenlik Onayı"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text("Onay Kodu",style: TextStyle(color: Colors.grey.shade800,fontSize:18,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Text(
                  "+90 ${widget.phoneNumber} numaralı telefonunuza gelen\n 6 haneli kodu giriniz. ",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink.shade900,width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(code[index], style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.grey.shade800)),
                ),
              ),
            ),
            SizedBox(height: 32),
            buildKeyboard(),
          ],
        ),
      ),
    );
  }

  Widget buildKeyboard() {
    List<String> keys = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "",
      "0",
      "<",
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: keys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (_, index) {
        String key = keys[index];
        return GestureDetector(
          onTap: () {
            if (key == '<') {
              deleteLastDigit();
            } else if (key != '') {
              onKeyTap(key);
            }
          },
          child: Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: key == "<"
                  ? Icon(Icons.backspace)
                  : Text(key, style: TextStyle(fontSize: 24)),
            ),
          ),
        );
      },
    );
  }
}
