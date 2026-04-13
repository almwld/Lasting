import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? error;
  final VoidCallback? onRetry;
  
  const ErrorScreen({super.key, this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: Colors.red),
              const SizedBox(height: 20),
              const Text(
                'عذراً، حدث خطأ غير متوقع',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                error ?? 'يرجى المحاولة مرة أخرى',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: onRetry ?? () => Navigator.pushReplacementNamed(context, '/'),
                    icon: const Icon(Icons.refresh),
                    label: const Text('إعادة المحاولة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    icon: const Icon(Icons.home),
                    label: const Text('الصفحة الرئيسية'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
