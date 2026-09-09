import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distância até minha casa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 245, 38, 124)),
        useMaterial3: true,
      ),
      home: const DistanciaPage(),
    );
  }
}

class DistanciaPage extends StatefulWidget {
  const DistanciaPage({super.key});

  @override
  State<DistanciaPage> createState() => _DistanciaPageState();
}

class _DistanciaPageState extends State<DistanciaPage> {
  String resultado = 'Clique no botão para calcular';

  // Coordenadas aproximadas da sua casa pelo CEP 13737-236
  static const double casaLatitude = -21.49868;
  static const double casaLongitude = -47.00482;

  Future<void> calcularDistancia() async {
    try {
      bool servicoAtivo = await Geolocator.isLocationServiceEnabled();

      if (!servicoAtivo) {
        setState(() {
          resultado = 'Ative a localização do celular.';
        });
        return;
      }

      LocationPermission permissao =
          await Geolocator.checkPermission();

      if (permissao == LocationPermission.denied) {
        permissao = await Geolocator.requestPermission();
      }

      if (permissao == LocationPermission.denied) {
        setState(() {
          resultado = 'Permissão de localização negada.';
        });
        return;
      }

      if (permissao == LocationPermission.deniedForever) {
        setState(() {
          resultado = 'Permissão de localização bloqueada.';
        });
        return;
      }

      // Pega a localização atual
      Position posicaoAtual =
          await Geolocator.getCurrentPosition();

      // Calcula a distância entre a escola e a casa
      double distancia = Geolocator.distanceBetween(
        posicaoAtual.latitude,
        posicaoAtual.longitude,
        casaLatitude,
        casaLongitude,
      );

      setState(() {
        if (distancia >= 1000) {
          resultado =
              '${(distancia / 1000).toStringAsFixed(2)} km';
        } else {
          resultado =
              '${distancia.toStringAsFixed(0)} metros';
        }
      });
    } catch (e) {
      setState(() {
        resultado = 'Erro ao obter localização.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qual a distância até minha casa?'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 80,
                color: Color.fromARGB(255, 208, 24, 104),
              ),

              const SizedBox(height: 20),

              const Text(
                'Distância entre o SESI e minha casa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Text(
                resultado,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: calcularDistancia,
                icon: const Icon(Icons.calculate),
                label: const Text(
                  'Calcular distância',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}