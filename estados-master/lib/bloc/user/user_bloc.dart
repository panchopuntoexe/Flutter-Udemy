//info actual y procesa eventos
import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivarUsuario>((event, emit) => emit(UserSetState(event.usuario)));

    on<EliminarUsuario>((event, emit) => emit(UserInitialState()));

    on<CambiarEdadUsuario>((event, emit) {
      if (!state.existeUsuario) return;
      emit(UserSetState(state.usuario!.copyWith(edad: event.edad)));
    });

    on<AgregarProfesionUsuario>((event, emit) {
      if (!state.existeUsuario) return;
      emit(UserSetState(state.usuario!.copyWith(
          profesiones: [...state.usuario!.profesiones, event.profesion])));
    });
  }

  /*@override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is ActivarUsuario) {
      yield UserInitialState(existeUsuario: true, usuario: event.usuario);
    }
  }*/
}
