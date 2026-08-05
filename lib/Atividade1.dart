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
          title: Text(
            "Atividade 1 - Container + Column + Row",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                color: const Color.fromARGB(255, 8, 0, 255),
                child: Center(
                  child: Text(
                    "Caixa 1",
                    style: TextStyle(
                      color: const Color.fromARGB(230, 255, 255, 255),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: const Color.fromARGB(255, 255, 0, 0),
                    child: Center(
                      child: Text(
                        "",
                        style: TextStyle(
                          color: const Color.fromARGB(230, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20),

                  Container(
                    width: 80,
                    height: 80,
                    color: const Color.fromARGB(255, 20, 122, 30),
                    child: Center(
                      child: Text(
                        "",
                        style: TextStyle(
                          color: const Color.fromARGB(230, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
