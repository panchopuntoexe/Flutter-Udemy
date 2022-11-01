import 'package:disenios/widgets/card_table.dart';
import 'package:disenios/widgets/titles.dart';
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Titles(),
          CardTable(),
        ],
      ),
    );
  }
}
