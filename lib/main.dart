import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/view_mode_provider.dart';
import 'providers/wallet_provider.dart';
import 'services/connection_checker.dart';
import 'services/storage/local_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_colors.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/main_navigation.dart';
import 'screens/home/home_screen.dart';
import 'screens/wallet/wallet_screen.dart';
import 'screens/wallet/transfer_screen.dart';
import 'screens/wallet/deposit_screen.dart';
import 'screens/wallet/withdraw_screen.dart';
import 'screens/wallet/transactions_screen.dart';
import 'screens/wallet/bill_payment_screen.dart';
import 'screens/wallet/recharge_screen.dart';
import 'screens/pro/pro_dashboard_screen.dart';
import 'screens/pro/pro_markets_screen.dart';
import 'screens/pro/pro_products_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // معالجة الأخطاء العالمية
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint("=== FLUTTER ERROR ===");
    debugPrint("Exception: ${details.exception}");
    debugPrint("Stack: ${details.stack}");
    debugPrint("====================");
  };
  
  try {
    // Initialize storage
    await LocalStorageService.init();
  } catch (e) {
    debugPrint("Storage init error: $e");
  }
  
  // Load environment variables
  try {
    await dotenv.load(fileName: '.env');
    debugPrint(".env loaded successfully");
  } catch (e) {
    debugPrint('Warning: .env file not found: $e');
  }
  
  // Initialize Supabase
  try {
    final url = dotenv.env['SUPABASE_URL'];
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];
    if (url != null && anonKey != null && url.isNotEmpty && anonKey.isNotEmpty) {
      await Supabase.initialize(url: url, anonKey: anonKey);
      debugPrint("Supabase initialized successfully");
    } else {
      debugPrint("Supabase credentials missing");
    }
  } catch (e) {
    debugPrint("Supabase initialization error: $e");
  }

  // System UI settings
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ViewModeProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => ConnectionChecker()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flex Yemen - فلكس يمن',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            locale: const Locale('ar', 'YE'),
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/main': (context) => const MainNavigation(),
              '/home': (context) => const HomeScreen(),
              '/wallet': (context) => const WalletScreen(),
              '/transfer': (context) => const TransferScreen(),
              '/deposit': (context) => const DepositScreen(),
              '/withdraw': (context) => const WithdrawScreen(),
              '/transactions': (context) => const TransactionsScreen(),
              '/bills': (context) => const BillPaymentScreen(),
              '/recharge': (context) => const RechargeScreen(),
              '/pro': (context) => const ProDashboardScreen(viewMode: 'pro'),
              '/pro/markets': (context) => const ProMarketsScreen(),
              '/pro/products': (context) => const ProProductsScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/notifications': (context) => const NotificationsScreen(),
              '/search': (context) => const SearchScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/categories': (context) => const CategoriesScreen(),
            },
          );
        },
      ),
    );
  }
}
