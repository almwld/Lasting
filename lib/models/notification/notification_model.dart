enum NotificationType { order, payment, promo, system }

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final String userId;
  final DateTime createdAt;
  bool isRead;
  
  NotificationModel({
    String? userId,
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.userId,
    required this.createdAt,
    this.isRead = false,
  });
}
