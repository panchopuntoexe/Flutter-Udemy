import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);

  //lista de titulos de juegos
  final titulosDeJuegos = const [
    'Super Mario Bros',
    'Zelda',
    'Metroid',
    'Chrono Trigger'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ListView Tipo 1')),
        body: ListView(
          children: [
            ...titulosDeJuegos
                .map((juego) => ListTile(
                      title: Text(juego),
                      leading: const Icon(Icons.gamepad),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ))
                .toList(),
          ],
        ));
  }
}
