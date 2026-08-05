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
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Desafio do Cartão SENAI'),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: CartaoBanco(), // Chamando o widget do cartão bancário
        ),
      ),
    );
  }
}

class CartaoBanco extends StatelessWidget {
  const CartaoBanco({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 220,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.blue[800], // cor principal do cartao
        borderRadius: BorderRadius.circular(15), //Bordas arredondadas
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // espalha os itens na vertical
        children: [
          //LOGO DO BANCO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sim_card, color: Colors.white, size: 32),
              Text(
                'Banco SESI / SENAI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),

          //NUMERO DO CARTAO
          Text(
            '1234 5678 9101 1121',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2.5 // Dá um espaço extra entre os números
            ),
          ),

          // NOME DO CLIENTE E DADOS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //Joga o nome pra esquerda e dados pra direita
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Coluna da esquerda: nome e telefone
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LEONARDO',
                    style: TextStyle(color: Colors.white, fontSize:16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Tel: (11) 98765-4321',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  )
                ],
              ),

              //Coluna da Direita: Agencia e conta
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Ag: 0001',
                    style: TextStyle(color: Colors.white60, fontSize: 12)
                  ),
                  Text(
                    'Cc: 12345-6',
                    style: TextStyle(color: Colors.white60, fontSize: 12)
                  ),
                ]
              )
            ]
          )
        ],
      )
    );
  }
}
