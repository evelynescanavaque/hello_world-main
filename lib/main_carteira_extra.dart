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
      debugShowCheckedModeBanner: false,
      title: "Carteira Digital",
      home: CarteiraDigital(),
    );
  }
}

class CarteiraDigital extends StatelessWidget {
  const CarteiraDigital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carteira Digital"), centerTitle: true),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          CartaoBanco(
            corCartao: Colors.blue,
            banco: "Banco SESI",
            numero: "1234 5678 9012 3456",
            nome: "Leonardo Kronka Rodrigues",
            validade: "12/30",
            bandeira: "assets/images/mastercard.png",
            logo: "assets/images/logo_sesi.jpg",
          ),

          SizedBox(height: 20),

          CartaoBanco(
            corCartao: Colors.orange,
            banco: "Inter",
            numero: "1234 5678 9012 3456",
            nome: "Leonardo Kronka Rodrigues",
            validade: "03/32",
            bandeira: "assets/images/mastercard.png",
            logo: "assets/images/logo_inter.png",
          ),

          SizedBox(height: 20),

          CartaoBanco(
            corCartao: const Color.fromARGB(255, 116, 72, 192),
            banco: "Nubank",
            numero: "1234 5678 9012 3456",
            nome: "Leonardo Kronka Rodrigues",
            validade: "07/31",
            bandeira: "assets/images/mastercard.png",
            logo: "assets/images/logo_nubank.png",
          ),

          SizedBox(height: 20),

          CartaoBanco(
            corCartao: const Color.fromARGB(255, 255, 149, 0),
            banco: "Itaú",
            numero: "1234 5678 9012 3456",
            nome: "Leonardo Kronka Rodrigues",
            validade: "03/30",
            bandeira: "assets/images/mastercard.png",
            logo: "assets/images/logo_itau.svg",
          ),
        ],
      ),
    );
  }
}

class CartaoBanco extends StatelessWidget {
  final Color corCartao;
  final String banco;
  final String numero;
  final String nome;
  final String validade;
  final String bandeira;
  final String logo;

  const CartaoBanco({
    super.key,
    required this.corCartao,
    required this.banco,
    required this.numero,
    required this.nome,
    required this.validade,
    required this.bandeira,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: corCartao,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                logo,
                width: 40,
                height: 40,
              ),

              SizedBox(width: 10),

              Text(
                banco,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 110),

              Icon(Icons.contactless, color: Colors.white), //aproximação

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    bandeira,
                    width: 40,
                    height: 40,
                  )
                ],
              ),
            ],
          ),

          Icon(Icons.sim_card, color: Colors.amber, size: 40),

          Text(
            numero,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Titular",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),

                  Text(
                    nome,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),

              


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Validade",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),

                  Text(
                    validade,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
