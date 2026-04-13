import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ProDashboardScreen extends StatelessWidget {
  final String viewMode;
  const ProDashboardScreen({super.key, required this.viewMode});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {"title": "إجمالي المبيعات", "value": "12,450", "icon": Icons.trending_up, "color": AppColors.primaryColor},
      {"title": "الطلبات", "value": "156", "icon": Icons.shopping_bag, "color": AppColors.secondaryColor},
      {"title": "العملاء", "value": "89", "icon": Icons.people, "color": AppColors.accentColor},
      {"title": "بائعون جدد", "value": "156", "icon": Icons.store, "color": AppColors.primaryColor},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('لوحة التحكم PRO')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('إحصائيات سريعة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: stats.length,
              itemBuilder: (context, index) {
                final stat = stats[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: (stat['color'] as Color).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(stat['icon'] as IconData, color: stat['color'] as Color, size: 28),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        stat['value'] as String,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        stat['title'] as String,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text('الأنشطة الأخيرة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.shopping_bag, size: 20)),
                title: const Text('طلب جديد #1234'),
                subtitle: Text('من محمد أحمد - ${DateTime.now().toString().substring(0, 10)}'),
                trailing: const Text('120 ر.ي'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.attach_money, size: 20)),
                title: const Text('سحب أموال'),
                subtitle: Text('من حساب المحفظة - ${DateTime.now().toString().substring(0, 10)}'),
                trailing: const Text('-500 ر.ي', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
