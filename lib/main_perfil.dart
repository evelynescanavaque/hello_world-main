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
        backgroundColor: Colors.grey[200], // Uma cor de fundo para destacar o container
        appBar: AppBar(
          title: const Text("Meu Perfil"),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: SingleChildScrollView( // Protege contra quebra de tela em celulares pequenos
            child: Container(
              width: 350,
              // Removi o height fixo para o container se adaptar ao conteúdo!
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue, // A cor agora fica DENTRO do decoration
                borderRadius: BorderRadius.circular(25), // Borda arredondada
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Faz a coluna ocupar apenas o espaço necessário
                children: [
                  // FOTO DE PERFIL
                  const CircleAvatar(
                    radius: 55, // Aumentei um pouco para dar destaque
                    backgroundImage: AssetImage('../assets/image/perfil.jpg'),
                  ),
                  
                  const SizedBox(height: 15), // Espaçamento pequeno
                  
                  // NOME
                  const Text(
                    "Leonardo Kronka Rodrigues",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 5), // Espaçamento bem pequeno
                  
                  // FUNÇÃO
                  Text(
                    "Desenvolvedor Mobile",
                    style: TextStyle(
                      color: Colors.blue[100], // Um azul clarinho para diferenciar do nome
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                  
                  const SizedBox(height: 40), // Espaçamento MAIOR para separar os contatos
                  
                  // EMAIL
                  const Text(
                    "leonardo@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  
                  // TELEFONE
                  const Text(
                    "11 99999-9999",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  
                  // CIDADE
                  const Text(
                    "Arceburgo - MG",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  
                  const SizedBox(height: 40), // Espaçamento antes da avaliação
                  
                  // AVALIAÇÃO (4 Estrelas e Meia)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star_half, color: Colors.amber, size: 30),
                      Text(
                        " 4.5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  
                  const SizedBox(height: 30), // Espaço final antes do botão
                  
                  // BOTÃO EDITAR PERFIL
                  ElevatedButton(
                    onPressed: () {}, // Sem função no momento
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Fundo do botão
                      foregroundColor: Colors.blue, // Cor do texto
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Botão bem arredondado
                      ),
                    ),
                    child: const Text(
                      "Editar Perfil",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}