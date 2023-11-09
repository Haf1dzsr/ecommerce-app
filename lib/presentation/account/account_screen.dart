import 'package:ecommerce_app/data/datasources/auth_local_datasources.dart';
import 'package:ecommerce_app/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthLocalDataSource().removeAuthData();
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ));
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
