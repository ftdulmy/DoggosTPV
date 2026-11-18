import 'package:doggos_tpv/widgets/order_list.dart';
import 'package:flutter/material.dart';

class ContainerData {
  final String name;
  final List<String> items;

  ContainerData({required this.name, required this.items});
}

class OrdersScreen extends StatelessWidget {
  final List<ContainerData> containers = [
    ContainerData(name: 'En proceso', items: ['Order #1', 'Order #2']),
    ContainerData(name: 'Listo para servir', items: ['Order #3', 'Order #4']),
    ContainerData(name: 'Entregado', items: ['Order #5']),
  ];
  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: containers.length,
          itemBuilder: (context, index) {
            final container = containers[index];

            return OrderList(container: container);
          },
        ),
      ),
    );
  }
}
