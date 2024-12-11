import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_responsive/core/constants/app_responsive.dart';

class SidebarMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const SidebarMenu(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return AppResponsive.isWeb(context)
        ? Scaffold(
            body: Row(
              children: [
                // Sidebar de navegación
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onItemTapped,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(CupertinoIcons.person),
                      label: Text('Perfil'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(CupertinoIcons.book),
                      label: Text('Inscripciones'),
                    ),
                  ],
                ),
                // Contenido principal
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Aquí puedes colocar las pantallas de contenido según el índice seleccionado
                        Text('Contenido de la aplicación'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox
            .shrink(); // No muestra el Sidebar en dispositivos móviles
  }
}
