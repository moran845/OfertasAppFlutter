import 'package:flutter/material.dart';

class practica extends StatelessWidget {
  const practica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interfaz Básica'),
        ),
        body: const Center(
          child: Text('¡Hola, Flutter!'),
        ),
      ),
    );
  }
}
