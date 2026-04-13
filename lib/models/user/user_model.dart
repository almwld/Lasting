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
