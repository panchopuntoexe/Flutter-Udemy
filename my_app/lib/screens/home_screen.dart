import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //key me sirve para identificar el widget en el contexto
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const fontSize = TextStyle(fontSize: 20);
    int counter = 10;

    return Scaffold(
      //widget que prepara la interfaz
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clicks counter',
              style: fontSize,
            ),
            Text(
              '$counter',
              style: fontSize,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print('Hola');
            counter++;
          }),
    );
  }
}
