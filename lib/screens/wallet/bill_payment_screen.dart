import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

class BillPaymentScreen extends StatelessWidget {
  const BillPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = [
      {'name': 'الكهرباء', 'icon': Icons.bolt, 'color': Colors.orange},
      {'name': 'المياه', 'icon': Icons.water_drop, 'color': Colors.blue},
      {'name': 'الإنترنت', 'icon': Icons.wifi, 'color': Colors.blue},
      {'name': 'الهاتف', 'icon': Icons.phone, 'color': Colors.teal},
      {'name': 'الغاز', 'icon': Icons.local_fire_department, 'color': Colors.red},
      {'name': 'البلدية', 'icon': Icons.location_city, 'color': AppColors.goldColor},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black87
          : Colors.grey.shade100,
      appBar: CustomAppBar(
        title: 'دفع الفواتير',
        showBackButton: true,
        showNotification: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: bills.length,
        itemBuilder: (context, index) {
          final bill = bills[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (bill['color'] as Color).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      bill['icon'] as IconData,
                      color: bill['color'] as Color,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    bill['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
