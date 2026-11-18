import 'package:flutter/material.dart';

class CreateOrdersScreen extends StatelessWidget {
  const CreateOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Orden')),
      body: const Center(child: Text('Pantalla para crear órdenes')),
    );
  }
}
