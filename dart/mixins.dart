abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

abstract class Volador {
  void volar() => print('Estoy volando');
}

abstract class Nadador {
  void nadar() => print('Estoy Nadando');
}

abstract class Caminante {
  void caminar() => print('Estoy caminando');
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Ave with Caminante, Volador {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}

class Pato extends Ave with Caminante, Volador, Nadador {}

class PexVolador extends Pez with Volador, Nadador {}

void main() {
  final flipper = new Delfin();
  flipper.nadar();

  final bat = new Murcielago();
  bat.caminar();
  bat.volar();
}
