import 'package:doggos_tpv/models/order.dart';
import 'package:doggos_tpv/widgets/order_list.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<Order> orders = [
    Order(
      id: '1',
      orderNumber: 'Order #1',
      customerName: 'John Doe',
      total: 100.0,
      status: OrderStatus.preparing,
    ),
    Order(
      id: '2',
      orderNumber: 'Order #2',
      customerName: 'Jane Smith',
      total: 150.0,
      status: OrderStatus.preparing,
    ),
    Order(
      id: '3',
      orderNumber: 'Order #3',
      customerName: 'Bob Johnson',
      total: 200.0,
      status: OrderStatus.ready,
    ),
    Order(
      id: '4',
      orderNumber: 'Order #4',
      customerName: 'Alice Williams',
      total: 120.0,
      status: OrderStatus.ready,
    ),
    Order(
      id: '5',
      orderNumber: 'Order #5',
      customerName: 'Charlie Brown',
      total: 180.0,
      status: OrderStatus.delivered,
    ),
  ];

  final List<OrderStatus> statuses = [
    OrderStatus.preparing,
    OrderStatus.ready,
    OrderStatus.delivered,
  ];

  final Map<OrderStatus, String> statusNames = {
    OrderStatus.preparing: 'En preparación',
    OrderStatus.ready: 'Listo para servir',
    OrderStatus.delivered: 'Entregado',
  };

  void moveOrder(
    Order order,
    OrderStatus destinationStatus,
    String? targetOrderId,
  ) {
    setState(() {
      if (targetOrderId == order.id) return;

      orders.removeWhere((item) => item.id == order.id);

      final updatedOrder = order.copyWith(status: destinationStatus);

      int destinationIndex;

      if (targetOrderId != null) {
        destinationIndex = orders.indexWhere(
          (item) => item.id == targetOrderId,
        );

        if (destinationIndex == -1) {
          destinationIndex = orders.length;
        }
      } else {
        final destinationIndexes = orders
            .asMap()
            .entries
            .where((entry) => entry.value.status == destinationStatus)
            .map((entry) => entry.key)
            .toList();

        destinationIndex = destinationIndexes.isEmpty
            ? orders.length
            : destinationIndexes.last + 1;
      }

      orders.insert(destinationIndex, updatedOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: statuses.length,
          itemBuilder: (context, index) {
            final status = statuses[index];

            final filteredOrders = orders
                .where((order) => order.status == statuses[index])
                .toList();

            return OrderList(
              title: statusNames[status]!,
              status: status,
              orders: filteredOrders,
              onMoveOrder: moveOrder,
            );
          },
        ),
      ),
    );
  }
}
