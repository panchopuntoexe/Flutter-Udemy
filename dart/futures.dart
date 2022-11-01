void main() async{
  print('Antes de la petición');

  final data = await httGet('url');
  print(data);

  //espera el future
  /*final nombre = await getNombre('10');
  print(nombre);*/
  //getNombre('10').then(print);

  print('Fin del programa');

}

//async retorna un future
Future<String> getNombre(String id) async{
  return '$id - Fernando';
}

Future<String> httGet(String url){
  return Future.delayed(
    Duration(seconds: 3),()=>'Hola mundo - 3 segundos');}