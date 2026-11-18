import 'package:doggos_tpv/models/order.dart';
import 'package:doggos_tpv/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.orders,
    required this.title,
    required this.status,
    required this.onMoveOrder,
  });
  final String title;
  final OrderStatus status;
  final List<Order> orders;

  final Function(Order, OrderStatus, String?) onMoveOrder;

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
              title,
            ),

            SizedBox(
              height: 150,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: orders.length + 1,
                itemBuilder: (context, itemIndex) {
                  if (itemIndex == orders.length) {
                    return DragTarget<Order>(
                      hitTestBehavior: HitTestBehavior.opaque,

                      onWillAcceptWithDetails: (details) {
                        return details.data.id.isNotEmpty;
                      },
                      onAcceptWithDetails: (details) {
                        final order = details.data;
                        onMoveOrder(order, status, null);
                      },
                      builder: (context, candidates, rejected) {
                        final isHovering = candidates.isNotEmpty;

                        return Container(
                          width: 65,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isHovering
                                ? Colors.deepOrange.withValues(alpha: 0.15)
                                : Colors.transparent,
                            border: Border.all(
                              color: candidates.isNotEmpty
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 30,
                          ),
                        );
                      },
                    );
                  }

                  final order = orders[itemIndex];

                  return DragTarget<Order>(
                    hitTestBehavior: HitTestBehavior.opaque,

                    onWillAcceptWithDetails: (details) {
                      return details.data.id != order.id;
                    },
                    onAcceptWithDetails: (details) {
                      onMoveOrder(details.data, status, order.id);
                    },
                    builder: (context, candidates, rejected) {
                      final isHovering = candidates.isNotEmpty;

                      return LongPressDraggable<Order>(
                        data: order,
                        feedback: Material(
                          color: Colors.transparent,
                          child: OrderItem(order: order),
                        ),
                        childWhenDragging: Opacity(
                          opacity: 0.5,
                          child: OrderItem(order: order),
                        ),
                        child: Container(
                          width: 140,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isHovering
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: OrderItem(order: order),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
