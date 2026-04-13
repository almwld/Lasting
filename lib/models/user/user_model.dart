class UserModel {
  final String id;
  final String name;
  final String email;
  final String? fullName;
  final String? avatarUrl;
  final String? userType;
  final String? city;
  final String? phone;
  final DateTime? createdAt;
  final bool isVerified;
  final int points;
  final int ordersCount;
  final int favoritesCount;
  final double rating;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.fullName,
    this.avatarUrl,
    this.userType,
    this.city,
    this.phone,
    this.createdAt,
    this.isVerified = false,
    this.points = 0,
    this.ordersCount = 0,
    this.favoritesCount = 0,
    this.rating = 0.0,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    fullName: json['fullName'],
    avatarUrl: json['avatarUrl'],
    userType: json['userType'],
    city: json['city'],
    phone: json['phone'],
    createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    isVerified: json['isVerified'] ?? false,
    points: json['points'] ?? 0,
    ordersCount: json['ordersCount'] ?? 0,
    favoritesCount: json['favoritesCount'] ?? 0,
    rating: (json['rating'] ?? 0).toDouble(),
  );

  UserModel copyWith({
    String? fullName,
    String? avatarUrl,
    String? city,
    String? phone,
  }) => UserModel(
    id: id,
    name: name,
    email: email,
    fullName: fullName ?? this.fullName,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    userType: userType ?? this.userType,
    city: city ?? this.city,
    phone: phone ?? this.phone,
    createdAt: createdAt,
    isVerified: isVerified,
    points: points,
    ordersCount: ordersCount,
    favoritesCount: favoritesCount,
    rating: rating,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'fullName': fullName,
    'avatarUrl': avatarUrl,
    'userType': userType,
    'city': city,
    'phone': phone,
    'createdAt': createdAt?.toIso8601String(),
    'isVerified': isVerified,
    'points': points,
    'ordersCount': ordersCount,
    'favoritesCount': favoritesCount,
    'rating': rating,
  };
}
