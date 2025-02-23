import 'package:flutter/material.dart';
import 'package:form_responsive/core/constants/app_strings.dart';
import 'package:form_responsive/features/profile/presentation/pages/profile_detail_page.dart';
import 'package:form_responsive/presentation/pages/home_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pantallas disponibles según el índice seleccionado
    final List<Widget> pages = [
      const HomePage(),
      const ProfileDetailPage(),
      const Placeholder(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 1
              ? AppStrings.profileTitle
              : _selectedIndex == 2
                  ? AppStrings.inscriptionsTitle
                  : 'Home',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                AppStrings.menuTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(AppStrings.profileTitle),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('crear inscripcion'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
