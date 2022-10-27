import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  //key me sirve para identificar el widget en el contexto
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void incrementar() {
    counter++;
    setState(() {});
  }

  void decrementar() {
    counter--;
    setState(() {});
  }

  void resetear() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = TextStyle(fontSize: 20);

    return Scaffold(
      //widget que prepara la interfaz
      appBar: AppBar(
        title: const Text('Counter Screen'),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
          increaseFunc: incrementar,
          decreaseFunc: decrementar,
          resetFunc: resetear),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFunc;
  final Function decreaseFunc;
  final Function resetFunc;
  const CustomFloatingActions({
    Key? key,
    required this.increaseFunc,
    required this.decreaseFunc,
    required this.resetFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () => increaseFunc()),
        //onPressed: () => setState(() => counter++)),
        FloatingActionButton(
            child: const Icon(Icons.restore), onPressed: () => resetFunc()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () => decreaseFunc()),
      ],
    );
  }
}
