void main(){
  final perro = new Perro();

  sonidoAnimal(perro);

  final gato = new Gato();

  sonidoAnimal(gato);
}

void sonidoAnimal(Animal animal){
  animal.emitirSonido();
}

//que no se inicializa
abstract class Animal{
  int? pata;

  Animal();

  void emitirSonido();
}

class Perro implements Animal{
  
  int? pata;

  void emitirSonido() => print('guau');
}

class Gato implements Animal{
  int? pata;
  int? cola;

  void emitirSonido() => print('miau');

}