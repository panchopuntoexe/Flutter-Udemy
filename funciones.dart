void main(){
  final nombre = 'Francisco';
  saludar(nombre,'Hi');
  saludar2(nombre : nombre,mensaje: 'Hi');
}

void saludar(String nombre,[String mensaje='Hola']) {
  print('$mensaje $nombre');
}

void saludar2({String nombre='No name',
required String mensaje}){
  print('$mensaje $nombre');
}