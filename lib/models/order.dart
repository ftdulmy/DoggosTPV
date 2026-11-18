enum OrderStatus { preparing, ready, delivered }

class Order {
  final String id;
  final String orderNumber;
  final String customerName;
  final double total;
  final OrderStatus status;

  Order({
    required this.id,
    required this.orderNumber,
    required this.customerName,
    required this.total,
    required this.status,
  });

  Order copyWith({OrderStatus? status}) {
    return Order(
      id: id,
      orderNumber: orderNumber,
      customerName: customerName,
      total: total,
      status: status ?? this.status,
    );
  }
}
