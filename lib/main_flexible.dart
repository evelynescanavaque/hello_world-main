import 'package:flutter/material.dart';

void main() {
  runApp(FlexibleExample());
}

class FlexibleExample extends StatelessWidget {
  const FlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo do Flexible',
      home: Scaffold(
        appBar: AppBar(title: const Text("Flexible")),
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: 120,
                color: Colors.red,
                child: const Center(
                  child: Text("Flex 1"),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                height: 120,
                color: Colors.blue,
                child: const Center(
                  child: Text("Flex 2", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}