import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

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
        appBar: AppBar(
          title: const Text('ListView Tipo 2'),
        ),
        body: ListView.separated(
          itemCount: titulosDeJuegos.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(titulosDeJuegos[i]),
              leading: const Icon(Icons.gamepad),
              trailing: const Icon(Icons.chevron_right, color: Colors.blueGrey),
              onTap: (() {
                final juegoSeleccionado = titulosDeJuegos[i];
                print(juegoSeleccionado);
              }),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
