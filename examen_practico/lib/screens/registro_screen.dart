import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
 
  final _formKey = GlobalKey<FormState>();

  
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _edadController = TextEditingController();
  final _institucionController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _edadController.dispose();
    _institucionController.dispose();
    super.dispose();
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos registrados correctamente')),
      );

      
      Navigator.pushNamed(
        context,
        '/resumen',
        arguments: {
          'nombre': _nombreController.text,
          'correo': _correoController.text,
          'edad': _edadController.text,
          'institucion': _institucionController.text,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Participante'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                  if (value.length < 5) return 'Mínimo 5 caracteres';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El correo es obligatorio';
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Ingrese un correo válido (debe contener @ y .)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  icon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.number, 
                validator: (value) {
                  if (value == null || value.isEmpty) return 'La edad es obligatoria';
                  final edad = int.tryParse(value);
                  if (edad == null) return 'Ingrese un valor numérico';
                  if (edad < 15 || edad > 80) return 'La edad debe estar entre 15 y 80 años';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _institucionController,
                decoration: const InputDecoration(
                  labelText: 'Institución de procedencia',
                  icon: Icon(Icons.business),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'La institución es obligatoria';
                  if (value.length < 5) return 'Mínimo 5 caracteres';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _enviarFormulario,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
