import 'package:flutter/material.dart';
import 'screens/inicio_screen.dart';
import 'screens/registro_screen.dart';
import 'screens/resumen_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema ITCA-MEGATEC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/resumen': (context) => const ResumenScreen(),
      },
    );
  }
}
