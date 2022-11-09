import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(
                    edad: 10, nombre: 'Juan', profesiones: ['Profesion 1']));
                Get.snackbar('Usuario Establecido', 'Se estableció el usuario',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    boxShadows: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                          offset: Offset(2.0, 10.0))
                    ]);
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(20);
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    'Profesion ${usuarioCtrl.profesionesCount + 1}');
              }),
          MaterialButton(
              child:
                  Text('Cambiar Tema', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    !Get.isDarkMode ? ThemeData.dark() : ThemeData.light());
              }),
        ],
      )),
    );
  }
}
