class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? originalPrice;
  final List<String> images;
  final String category;
  final String city;
  final String sellerId;
  final String sellerName;
  final double? rating;
  final int? reviewCount;
  final DateTime createdAt;
  final bool isFeatured;
  final bool isAuction;
  final DateTime? auctionEndTime;
  final double? currentBid;
  final int stock;
  final bool inStock;
  final Map<String, String>? specifications;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.images,
    required this.category,
    required this.city,
    required this.sellerId,
    required this.sellerName,
    this.rating,
    this.reviewCount,
    required this.createdAt,
    this.isFeatured = false,
    this.isAuction = false,
    this.auctionEndTime,
    this.currentBid,
    this.stock = 0,
    this.inStock = true,
    this.specifications,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      originalPrice: json['original_price']?.toDouble(),
      images: List<String>.from(json['images'] ?? []),
      category: json['category'] ?? '',
      city: json['city'] ?? '',
      sellerId: json['seller_id'] ?? '',
      sellerName: json['seller_name'] ?? '',
      rating: json['rating']?.toDouble(),
      reviewCount: json['review_count'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      isFeatured: json['is_featured'] ?? false,
      isAuction: json['is_auction'] ?? false,
      auctionEndTime: json['auction_end_time'] != null
          ? DateTime.parse(json['auction_end_time'])
          : null,
      currentBid: json['current_bid']?.toDouble(),
      stock: json['stock'] ?? 0,
      inStock: json['in_stock'] ?? true,
      specifications: json['specifications'] != null
          ? Map<String, String>.from(json['specifications'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'original_price': originalPrice,
      'images': images,
      'category': category,
      'city': city,
      'seller_id': sellerId,
      'seller_name': sellerName,
      'rating': rating,
      'review_count': reviewCount,
      'created_at': createdAt.toIso8601String(),
      'is_featured': isFeatured,
      'is_auction': isAuction,
      'auction_end_time': auctionEndTime?.toIso8601String(),
      'current_bid': currentBid,
      'stock': stock,
      'in_stock': inStock,
      'specifications': specifications,
    };
  }

  double? get discountPercentage {
    if (originalPrice == null || originalPrice! <= price) return null;
    return ((originalPrice! - price) / originalPrice! * 100);
  }

  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? originalPrice,
    List<String>? images,
    String? category,
    String? city,
    String? sellerId,
    String? sellerName,
    double? rating,
    int? reviewCount,
    DateTime? createdAt,
    bool? isFeatured,
    bool? isAuction,
    DateTime? auctionEndTime,
    double? currentBid,
    int? stock,
    bool? inStock,
    Map<String, String>? specifications,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      images: images ?? this.images,
      category: category ?? this.category,
      city: city ?? this.city,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      createdAt: createdAt ?? this.createdAt,
      isFeatured: isFeatured ?? this.isFeatured,
      isAuction: isAuction ?? this.isAuction,
      auctionEndTime: auctionEndTime ?? this.auctionEndTime,
      currentBid: currentBid ?? this.currentBid,
      stock: stock ?? this.stock,
      inStock: inStock ?? this.inStock,
      specifications: specifications ?? this.specifications,
    );
  }
}
