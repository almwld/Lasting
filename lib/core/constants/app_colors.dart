import 'package:flutter/material.dart';

class AppColors {
  // الألوان الأساسية
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFFFF6B6B);
  static const Color accent = Color(0xFF4ECDC4);
  static const Color warning = Color(0xFFF39C12);
  static const Color success = Color(0xFF2ECC71);
  static const Color error = Color(0xFFE74C3C);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldDark = Color(0xFFC6A700);
  static const Color goldLight = Color(0xFFF4D03F);

  // الثيمات
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scaffoldBg = Color(0xFFF8F9FA);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFE0E0E0);

  // النصوص
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textHint = Color(0xFF999999);
  static const Color textLight = Color(0xFFBBBBBB);

  // التدرجات
  static const LinearGradient goldGradient = LinearGradient(
    colors: [gold, goldLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF8B82FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, Color(0xFF6DD5ED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ألوان الوضع الداكن
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
}
