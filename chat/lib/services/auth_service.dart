import 'dart:convert';

import 'package:chat/global/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/login_response.dart';
import '../models/usuario.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;

  //crear instacia de storage
  final _storage = FlutterSecureStorageWeb();

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  //Getters del token de forma estática
  static Future<String?> getToken() async {
    final _storage = FlutterSecureStorageWeb();
    //leer token de forma estática
    final token = await _storage.read(key: 'token', options: {});
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = FlutterSecureStorageWeb();
    //leer token de forma estática
    final token = await _storage.delete(key: 'token', options: {});
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;
    await Future.delayed(Duration(milliseconds: 1000));
    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Enviroment.apiUrl}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(resp.body);
    this.autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      //guardar token en lugar seguro
      await _guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }

  Future register(String nombre, String email, String password) async{
    this.autenticando = true;
    
    final data = {'nombre': nombre, 'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Enviroment.apiUrl}/login/new'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(resp.body);
    this.autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      //guardar token en lugar seguro
      await _guardarToken(loginResponse.token);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }

  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token, options: {});
  }

  Future _logout() async {
    return await _storage.delete(key: 'token', options: {});
  }
}
