import 'package:flutter/material.dart';

void main() {
  runApp(SafeAreaExample());
}

class SafeAreaExample extends StatelessWidget {
  const SafeAreaExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SafeArea",
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: const [
              Text("Aplicação Flutter", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              Text("O SafeArea evita que o conteúdo seja sobreposto por elementos do sistema, como a barra de status ou o notch.", textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

