//acciones que recibe el bloc y cambia el estado

part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivarUsuario extends UserEvent {
  final Usuario usuario;

  ActivarUsuario(this.usuario);
}

class CambiarEdadUsuario extends UserEvent {
  final int edad;

  CambiarEdadUsuario(this.edad);
}

class AgregarProfesionUsuario extends UserEvent {
  final String profesion;

  AgregarProfesionUsuario(this.profesion);
}

class EliminarUsuario extends UserEvent {}