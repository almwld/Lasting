import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المحفظة')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // بطاقة الرصيد
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.primaryColor, AppColors.primaryColor.withOpacity(0.7)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('الرصيد الحالي', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8),
                  Text('12,450 ر.ي', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // خدمات المحفظة
            const Text('خدمات المحفظة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildServiceCard(Icons.arrow_downward, 'إيداع'),
                _buildServiceCard(Icons.arrow_upward, 'سحب'),
                _buildServiceCard(Icons.swap_horiz, 'تحويل'),
                _buildServiceCard(Icons.history, 'المعاملات'),
              ],
            ),
            const SizedBox(height: 24),
            // آخر المعاملات
            const Text('آخر المعاملات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildTransactionCard('إيداع نقدي', '+5,000 ر.ي', 'اليوم', Colors.green),
            _buildTransactionCard('سحب من البنك', '-2,000 ر.ي', 'أمس', Colors.red),
            _buildTransactionCard('تحويل إلى أحمد', '-500 ر.ي', 'قبل يومين', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTransactionCard(String title, String amount, String date, Color amountColor) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: amountColor.withOpacity(0.1),
          child: Icon(amount.contains('+') ? Icons.arrow_downward : Icons.arrow_upward, color: amountColor),
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount, style: TextStyle(color: amountColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
