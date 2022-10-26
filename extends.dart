void main(){
  final superman = new Heroe('clarkkent');
  final vil = new Villano('lex');
  print(superman);
  print(vil);
}

abstract class Personaje{
  String? poder;
  String nombre;

  Personaje(this.nombre);

  @override
  String toString() {
    return '$nombre - $poder';
  }
}

class Heroe extends Personaje{

  int valentia = 100;
  //: para que se ejecute mientras se inicialice
  Heroe(String nombre):super(nombre);
}

class Villano extends Personaje{

  int maldad = 50;
  
  Villano(String nombre):super(nombre);
}