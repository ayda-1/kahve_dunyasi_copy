import 'package:flutter/material.dart';
import 'verification_screen.dart'; // doğrulama ekranı

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isValid = false;

  void checkPhoneValid(String value) {
    setState(() {
      isValid = value.length == 10; // Örn: 10 haneli (5xx1234567)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kahve Dünyası"),
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Kahve Dünyası'na Hoşgeldin",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Kahve Dünyası uygulamasında seni bekleyen sürprizlere ulaşmak için oturum aç veya kaydol",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              controller: phoneController,
              onChanged: checkPhoneValid,
              decoration: InputDecoration(
                labelText: "Telefon Numarası (5xx1234567)",
                border: OutlineInputBorder(),
                prefixText: "+90 5",
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: isValid
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VerificationScreen(
                            phoneNumber: phoneController.text,
                          ),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade900,
                foregroundColor: Colors.white,
              ),
              child: Text("Giriş Yap"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/entry");
              },
              child: Text("Üye olmadan devam et"),
            ),
          ],
        ),
      ),
    );
  }
}
