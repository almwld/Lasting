class UserModel {
  final String id;
  final String name;
  final String email;
  final String? fullName;
  final String? avatarUrl;
  final String? userType;
  final String? city;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.fullName,
    this.avatarUrl,
    this.userType,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    fullName: json['fullName'],
    avatarUrl: json['avatarUrl'],
    userType: json['userType'],
    city: json['city'],
  );

  UserModel copyWith({
    String? fullName,
    String? avatarUrl,
    String? city,
  }) => UserModel(
    id: id,
    name: name,
    email: email,
    fullName: fullName ?? this.fullName,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    userType: userType ?? this.userType,
    city: city ?? this.city,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'fullName': fullName,
    'avatarUrl': avatarUrl,
    'userType': userType,
    'city': city,
  };
}
