import 'package:doggos_tpv/models/order.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: TextStyle(fontWeight: FontWeight.bold),
                '#${order.orderNumber}',
              ),
              Text(
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                order.customerName,
              ),
              const SizedBox(height: 18),
              Text(style: TextStyle(fontStyle: FontStyle.italic), 'Total:'),
              Text(
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                '\$${order.total.toStringAsFixed(2)}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
