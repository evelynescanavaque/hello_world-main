import 'package:flutter/material.dart';

//Run | Debug | Profile
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ContadorCurtidas());
  }
}

class ContadorCurtidas extends StatefulWidget {
  const ContadorCurtidas({super.key});

  @override
  _ContadorCurtidasState createState() => _ContadorCurtidasState();
}

class _ContadorCurtidasState extends State<ContadorCurtidas> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  void excluir() {
    setState(() {
      if (contador > 0) {
        contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo setState")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 60,
              color: const Color.fromARGB(255, 255, 0, 0),
            ),

            SizedBox(height: 20),

            Text(
              "$contador curtidas",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: incrementar, child: Text("👍curtir")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: excluir, child: Text("👎descurtir")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
