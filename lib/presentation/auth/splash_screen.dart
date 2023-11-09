import 'package:ecommerce_app/common/constants/images.dart';
import 'package:ecommerce_app/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
