enum OrderStatus { pending, processing, shipped, delivered, cancelled }

class OrderModel {
  final String id;
  final OrderStatus status;
  final double total;
  final DateTime createdAt;
  
  OrderModel({
    required this.id,
    required this.status,
    required this.total,
    required this.createdAt,
  });
}
