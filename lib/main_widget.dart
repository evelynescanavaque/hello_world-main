import 'package:flutter/material.dart';

//Run | Debug | Profile
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Minha tela")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.apple,
                size: 60,
                color: const Color.fromARGB(255, 255, 0, 0),
              ),

              SizedBox(height: 20),

              Text(
                "D.S é o melhor curso do SESI?",
                style: TextStyle(
                  fontSize: 22,
                  color: const Color.fromARGB(255, 34, 0, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print("Usuário clicou");
                },
                child: Text("Curtir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
