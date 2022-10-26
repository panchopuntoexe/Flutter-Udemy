void main(){
  bool? isActive = null;

  if (isActive==null){
    print('isActive es null');
  }
  else{
    print('isActive no es null');
  }
}


//lista

void listas(){
  //lista dinámica
  List numeros = [1,2,3,4,5,6,7,8,9];
  numeros.add('10596');

  print(numeros[10]);

  List<int> num = [1,2,3,4,5,6,7,8,9];
  num.add(10);

  print(num[10]);

  final masNumeros = List.generate(10, (int index) => index);
  print(masNumeros);
}

void mapas(){
  Map persona = {
    'nombre':'Fernando',
    'edad':35,
    'soltero':false,
    true:false,
    1:100
  };
  int edad = persona['edad'];
  int falso = persona[true]; 
  persona.addAll({3:'Juan'});//append
  print(persona);

  
  Map<String, dynamic> persona1 = {
    'nombre':'Fernando',
    'edad':35,
    'soltero':'false',
    'true':false,
    '1':'100'
  };
  persona1.addAll({'3':'Juan'});//append

  print(persona);
}