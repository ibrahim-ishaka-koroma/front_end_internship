import 'package:flutter/material.dart';
import 'package:flutter_otp_rest_starter/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/themes/app_theme.dart';
import 'config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // For development: print the error
    debugPrint('Firebase initialization error: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter OTP REST Starter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login, // safer to use AppRoutes constant
    );
  }
}
