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
