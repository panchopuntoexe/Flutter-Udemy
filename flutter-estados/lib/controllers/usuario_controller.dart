import 'package:get/get.dart';

import '../models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  int get profesionesCount => this.usuario.value.profesiones.length;

  void cargarUsuario(Usuario usuario) {
    this.usuario.value = usuario;
    this.existeUsuario.value = true;
  }

  void cambiarEdad(int edad) {
    this.usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    this.usuario.update((val) {
      val!.profesiones.add(profesion);
    });
  }
}
