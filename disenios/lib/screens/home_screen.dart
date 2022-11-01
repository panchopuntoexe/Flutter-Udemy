import 'package:flutter/material.dart';
import 'package:disenios/widgets/main_content.dart';
import 'package:disenios/widgets/background.dart';

import '../widgets/custom_bottom_nav.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          MainContent(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
