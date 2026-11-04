import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('institucion-tecnologica'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/image_6604397.png',
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image, size: 150, color: Colors.grey);
                  },
                ),
              ),
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, size: 40, color: Colors.blue),
                  SizedBox(width: 10),
                  Icon(Icons.computer, size: 40, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 30),
              
              const Text(
                'Registro de Capacitaciones Tecnológicas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
            
              const Text(
                'Registra tus datos para participar en nuestras próximas actividades de formación profesional.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('Registrar participante'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
