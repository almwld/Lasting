#!/bin/bash

# ProductModel
cat > lib/models/product/product_model.dart << 'EOF'
class ProductModel {
  final String id;
  final String name;
  final double price;
  final double? oldPrice;
  final String? marketName;
  final bool isFavorite;
  final double? discount;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.oldPrice,
    this.marketName,
    this.isFavorite = false,
    this.discount,
  });
  
  String get formattedPrice => '${price.toStringAsFixed(0)} ﷼';
  String? get formattedOldPrice => oldPrice != null ? '${oldPrice!.toStringAsFixed(0)} ﷼' : null;
}
EOF

# UserModel
cat > lib/models/user/user_model.dart << 'EOF'
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final int ordersCount;
  final int favoritesCount;
  final double rating;
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.ordersCount = 0,
    this.favoritesCount = 0,
    this.rating = 0.0,
  });
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
  };
}
EOF

# ProductCategory
cat > lib/models/product/product_category.dart << 'EOF'
class ProductCategory {
  final String id;
  final String name;
  final dynamic icon;
  final int marketCount;
  
  ProductCategory({
    required this.id,
    required this.name,
    required this.icon,
    this.marketCount = 0,
  });
}
EOF

# NotificationModel
cat > lib/models/notification/notification_model.dart << 'EOF'
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
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.userId,
    required this.createdAt,
    this.isRead = false,
  });
}
EOF

# AppColors
cat > lib/core/constants/app_colors.dart << 'EOF'
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);
  static const Color goldColor = Color(0xFFFFD700);
  static const Color scaffoldBg = Color(0xFFF5F5F5);
  static const Color cardColor = Colors.white;
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color textSecondary = Color(0xFF757575);
}
EOF

# AppStrings
cat > lib/core/constants/app_strings.dart << 'EOF'
class AppStrings {
  static const String appName = 'Flex Yemen';
  static const String categories = 'الأقسام';
  static const String notifications = 'الإشعارات';
  static const String liteMode = 'الوضع البسيط';
  static const String expertMode = 'الوضع المتقدم';
}
EOF

# OrderStatus
cat > lib/models/order/order_model.dart << 'EOF'
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
EOF
