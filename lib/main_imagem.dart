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
        appBar: AppBar(title: const Text("Imagem SENAI"), centerTitle: true,),
        body: Center(child: Image.asset('assets/images/fundo.jpg'),),
      ),
    );
  }
}