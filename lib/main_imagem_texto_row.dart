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
        appBar: AppBar(title: const Text("Texto e Imagem"), centerTitle: true,),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bem-Vindo", style: TextStyle(fontSize: 24)),
              const SizedBox(width: 20),
              Image.asset('assets/images/fundo.jpg', width: 200,)
            ],
          )
          ),
      ),
    );
  }
}