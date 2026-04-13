import 'package:flutter/material.dart';

class AppColors {
  // الألوان الأساسية
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFFF6B6B);
  static const Color accentColor = Color(0xFF4ECDC4);
  
  // الألوان الذهبية
  static const Color goldColor = Color(0xFFD4AF37);
  static const Color goldDark = Color(0xFFC6A700);
  static const Color goldLight = Color(0xFFF4D03F);
  
  // الألوان الأخرى
  static const Color warningColor = Color(0xFFF39C12);
  static const Color successColor = Color(0xFF2ECC71);
  static const Color errorColor = Color(0xFFE74C3C);
  
  // مرادفات للتوافق
  static const Color primary = primaryColor;
  static const Color secondary = secondaryColor;
  static const Color accent = accentColor;
  static const Color gold = goldColor;
  static const Color warning = warningColor;
  static const Color success = successColor;
  static const Color error = errorColor;
  
  // الثيمات
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scaffoldBg = Color(0xFFF8F9FA);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFE0E0E0);
  
  // النصوص
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF666666);
  
  // الوضع الداكن
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
  
  // التدرجات
  static const LinearGradient goldGradient = LinearGradient(
    colors: [goldColor, goldLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
