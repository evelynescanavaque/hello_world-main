import 'package:flutter/material.dart';

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
          title: const Text('Carteira Digital SENAI'),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [

              CartaoBanco(
                nome: 'LEONARDO',
                numero: '1234 5678 9101 1121',
                telefone: '(11) 98765-4321',
                agencia: '0001',
                conta: '12345-6',
                cor: Colors.blue,
              ),

              SizedBox(height: 20),

              CartaoBanco(
                nome: 'CAUE',
                numero: '9999 8888 7777 6666',
                telefone: '(21) 91234-5678',
                agencia: '0002',
                conta: '98765-4',
                cor: Colors.green,
              ),

              SizedBox(height: 20),

              CartaoBanco(
                nome: 'JOAO',
                numero: '1111 2222 3333 4444',
                telefone: '(31) 99876-5432',
                agencia: '0003',
                conta: '11111-2',
                cor: Colors.purple,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class CartaoBanco extends StatelessWidget {
  // Parâmetros que o cartão recebe de fora
  final String nome;
  final String numero;
  final String telefone;
  final String agencia;
  final String conta;
  final Color cor;

  const CartaoBanco({
    super.key,
    required this.nome,
    required this.numero,
    required this.telefone,
    required this.agencia,
    required this.conta,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 220,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: cor, // usa a variável cor, não mais Colors.blue[800] fixo
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // LOGO DO BANCO
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sim_card, color: Colors.white, size: 32),
              Text(
                'Banco SESI / SENAI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // NUMERO DO CARTAO
          Text(
            numero, // variável
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2.5,
            ),
          ),

          // NOME DO CLIENTE E DADOS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              // Coluna da esquerda: nome e telefone
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome, // variável
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tel: $telefone', // variável
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),

              // Coluna da direita: agencia e conta
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Ag: $agencia', // variável
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  Text(
                    'Cc: $conta', // variável
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
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