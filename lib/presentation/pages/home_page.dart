import 'package:flutter/material.dart';
import 'package:form_responsive/core/constants/app_strings.dart';
import 'package:form_responsive/features/profile/presentation/pages/profile_page.dart';
import 'package:form_responsive/presentation/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      const ProfilePage(),
      const Placeholder(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0
              ? AppStrings.profileTitle
              : AppStrings.inscriptionsTitle,
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
              title: const Text(AppStrings.profileTitle),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                _onItemTapped(0); // Cambia al índice 0
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text(AppStrings.inscriptionsTitle),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                _onItemTapped(1); // Cambia al índice 1
              },
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
