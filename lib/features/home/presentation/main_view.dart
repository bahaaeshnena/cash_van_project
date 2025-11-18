import 'package:cach_van/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('الرئيسية')),       // استبدلها بالـ HomeScreen
    Center(child: Text('الملف الشخصي')),   // استبدلها بالـ ProfileScreen
    Center(child: Text('الإعدادات')),      // استبدلها بالـ SettingsScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
