import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  final String name;
  final IconData icon;
  final String route;
  final Widget screen;

  MenuOption(
      {required this.name,
      required this.icon,
      required this.route,
      required this.screen});
}
