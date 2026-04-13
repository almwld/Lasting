import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../models/product/product_category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<ProductCategory> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() {
    setState(() {
      _categories = [
        ProductCategory(id: '1', name: 'المطاعم', icon: Icons.restaurant),
        ProductCategory(id: '2', name: 'الكافيهات', icon: Icons.local_cafe),
        ProductCategory(id: '3', name: 'السوبرماركت', icon: Icons.shopping_cart),
        ProductCategory(id: '4', name: 'الصيدليات', icon: Icons.local_pharmacy),
        ProductCategory(id: '5', name: 'المولات', icon: Icons.shopping_bag),
        ProductCategory(id: '6', name: 'الإلكترونيات', icon: Icons.devices),
        ProductCategory(id: '7', name: 'الملابس', icon: Icons.checkroom),
        ProductCategory(id: '8', name: 'المكياج', icon: Icons.face),
        ProductCategory(id: '9', name: 'الرياضة', icon: Icons.sports_soccer),
        ProductCategory(id: '10', name: 'الكتب', icon: Icons.menu_book),
        ProductCategory(id: '11', name: 'الألعاب', icon: Icons.toys),
        ProductCategory(id: '12', name: 'ال家具', icon: Icons.chair),
      ];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text(AppStrings.categories),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.cardColor,
        foregroundColor: Colors.black87,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return _buildCategoryItem(category);
              },
            ),
    );
  }

  Widget _buildCategoryItem(ProductCategory category) {
    return InkWell(
      onTap: () {
        // Navigate to category products
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor.withOpacity( 0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                category.icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${category.marketCount} متجر',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
