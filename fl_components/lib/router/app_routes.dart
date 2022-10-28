import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        name: 'Listview 1',
        icon: Icons.list,
        route: 'listview1',
        screen: const ListView1Screen()),
    MenuOption(
        name: 'Listview 2',
        icon: Icons.list_alt,
        route: 'listview2',
        screen: const ListView2Screen()),
    MenuOption(
        name: 'Tarjeta',
        icon: Icons.card_travel,
        route: 'card',
        screen: const CardScreen()),
    MenuOption(
        name: 'Alerta',
        icon: Icons.crisis_alert_sharp,
        route: 'alert',
        screen: const AlertScreen()),
    MenuOption(
        name: 'Avatar',
        icon: Icons.person,
        route: 'avatar',
        screen: const AvatarScreen()),
    MenuOption(
        name: 'Animated',
        icon: Icons.play_circle_fill,
        route: 'animated',
        screen: const AnimatedScreen()),
    MenuOption(
        name: 'Inputs',
        icon: Icons.input,
        route: 'inputs',
        screen: const InputsScreen()),
    MenuOption(
        name: 'Slider',
        icon: Icons.slideshow,
        route: 'slider',
        screen: const SliderScreen()),
    MenuOption(
        name: 'Infinite scroll',
        icon: Icons.swap_vert_circle_outlined,
        route: 'listviewbuilder',
        screen: const ListViewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    final Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (context) => option.screen});
    }
    return appRoutes;
  }

  /*
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listview1': (BuildContext context) => const ListView1Screen(),
    'listview2': (BuildContext context) => const ListView2Screen(),
    'card': (BuildContext context) => const CardScreen(),
    'alert': (BuildContext context) => const AlertScreen(),
  };*/

  static Route<dynamic> onGenerateRoute(settings) {
    print(settings);
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
