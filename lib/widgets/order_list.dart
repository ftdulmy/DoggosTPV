import 'package:doggos_tpv/screens/orders.dart';
import 'package:doggos_tpv/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key, required this.container});
  final ContainerData container;

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  ContainerData get container => widget.container;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              container.name,
            ),

            SizedBox(
              height: 150,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: container.items.length,
                itemBuilder: (context, itemIndex) {
                  final item = container.items[itemIndex];

                  return OrderItem(orderName: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
