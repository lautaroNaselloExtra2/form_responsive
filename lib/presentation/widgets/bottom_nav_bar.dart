import 'package:flutter/material.dart';
import 'package:form_responsive/core/constants/app_responsive.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AppResponsive.adaptiveBuilder(
      context: context,
      mobile: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cambiar Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Nueva Inscripción',
          ),
        ],
      ),
      web: const SizedBox.shrink(),
    );
  }
}
