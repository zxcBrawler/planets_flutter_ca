import 'package:flutter/material.dart';

class CustomBottomNavItem extends BottomNavigationBarItem {
  final String initialLocation;

  const CustomBottomNavItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}
