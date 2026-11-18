import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String orderName;

  const OrderItem({super.key, required this.orderName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
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
              Text(style: TextStyle(fontWeight: FontWeight.bold), orderName),
              Text(style: TextStyle(fontSize: 16), 'Juan Perez'),
              const SizedBox(height: 18),
              Text(style: TextStyle(fontStyle: FontStyle.italic), 'Total:'),
              Text(
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                '\$50.00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
