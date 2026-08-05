import 'package:flutter/material.dart';

void main() {
  runApp(SafeAreaAtividade());
}

class SafeAreaAtividade extends StatelessWidget {
  const SafeAreaAtividade({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo do MediaQuery',
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: "Login Responsivo",
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: largura * 0.8,
                child: Column(
                  children: [
                    Icon(Icons.lock, size: 80, color: Colors.blue),

                    SizedBox(height: altura * 0.02),

                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: altura * 0.05),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: altura * 0.05),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: altura * 0.07),

                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Entrar"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),

                    SizedBox(height: altura * 0.02),

                    TextButton(onPressed: () {}, child: Text("Criar conta")),

                    SizedBox(height: altura * 3.0),

                    TextButton(onPressed: () {}, child: Text("overflow")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
