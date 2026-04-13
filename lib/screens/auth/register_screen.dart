import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _acceptTerms = false;
  bool _isLoading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى قبول الشروط والأحكام")),
      );
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'الاسم الكامل'),
                validator: (v) => v?.isEmpty == true ? 'الاسم مطلوب' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
                validator: (v) => v?.isEmpty == true ? 'البريد مطلوب' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'كلمة المرور'),
                validator: (v) => (v?.length ?? 0) < 6 ? '6 أحرف على الأقل' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (v) => setState(() => _acceptTerms = v ?? false),
                    activeColor: AppColors.primaryColor,
                  ),
                  const Text('أوافق على الشروط والأحكام'),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _register,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                child: _isLoading ? const CircularProgressIndicator() : const Text('إنشاء حساب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
