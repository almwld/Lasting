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
