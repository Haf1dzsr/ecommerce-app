// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/constants/images.dart';
import 'package:ecommerce_app/presentation/account/account_screen.dart';
import 'package:ecommerce_app/presentation/cart/cart_screen.dart';
import 'package:ecommerce_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    const HomeScreen(),
    // const Center(child: Text('Explore Screen')),
    const CartScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
    _selectedIndex.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, value, _) {
        return Scaffold(
          body: _pages[_selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex.value,
            selectedItemColor: ColorName.primary,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.iconHome)),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: ImageIcon(AssetImage(Images.iconSearch)),
              //   label: 'Explore',
              // ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.iconCart)),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.iconUser)),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
