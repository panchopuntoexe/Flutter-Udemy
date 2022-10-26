import 'dart:math';

void main(List<String> args) {
  final rawJson = {'nombre': 'Tony Stark'};

  /*final antman = new Heroe(nombre: rawJson['nombre'], 
  poder: rawJson['poder']);
  print(antman);*/

  final iron = Heroe.fromJson(rawJson);
  print(iron);

  final cuadrado = new Cuadrado(5);
  print('area: ${cuadrado.calcularArea()}');
  print('area get: ${cuadrado.area}');

  cuadrado.area = 20;
  
}

class Heroe {
  String nombre;
  String poder;

  Heroe({required this.nombre, required this.poder});

  Heroe.fromJson(Map<String,String> json):
    this.nombre = json['nombre']!,
    this.poder = json['poder']??'No tiene poder';
  

  @override
  String toString() {
    return 'nombre: ${this.nombre}, poder: ${this.poder}';
  }
}

class Cuadrado{
  double lado;

  //getter
  double get area{
    return this.lado*this.lado;
  }
  
  set area(double valor){
    this.lado = sqrt(valor);
    print('set: $valor');
  }
  Cuadrado(double lado):
  this.lado = lado;

  double calcularArea(){
    return this.lado *this.lado;
  }

}
