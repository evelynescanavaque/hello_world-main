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
        appBar: AppBar(
          title: Text("Exemplo Container"),
        ),

        body: Container(
          width: 200,
          height: 100,
          color: Colors.green,
          child: Center(
            child:Text("Olá flutter", style: TextStyle(color: const Color.fromARGB(230, 255, 255, 255)),),
          ),
        ),
      ),
    );
  }
}